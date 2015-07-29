require_relative '../lib/launcher_lunches'

describe 'launcher lunches' do
  it 'returns most expensize item' do
    expect(most_expensive).to eq "Veggie surprise bag from Adam's Veggie Express"
  end

  it 'returns the cost of ordering one of everything from a given restaurant' do
    expect(one_of_everything_from("Adam's Veggie Express")).to eq 23.42
    expect(one_of_everything_from("Sam's Sandwhiches")).to eq 23.72
    expect(one_of_everything_from("Eric's Emo Eats")).to eq 19.41
  end

  it 'estimates total number of eggs needed for the month (30 days)' do
    # 2 eggs used per menu item, on average 8 items sold per hour of operation
    expect(monthly_egg_count).to eq 10080
  end

  it 'lists all items for lactose intolerant individuals by price' do
    lf_items = [
      :corn_on_the_cob,
      :apathetic_eggs,
      :mopey_falafels,
      :fluffer_nutter_with_bacon,
      :veggie_surprise_bag
    ]

    expect(lactose_free_items).to eq lf_items
  end
end
