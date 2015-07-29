class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :provider, null: false
      table.string :uid, null: false
      table.string :username, null: false
      table.string :email, null: false
      table.string :avatar_url, null: false

      table.timestamps
    end

    add_index :users, [:uid, :provider], unique: true
  end
end
