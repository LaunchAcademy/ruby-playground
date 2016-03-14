class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :description
      t.string :image
      t.integer :year
      t.timestamps null: false
    end
  end
end
