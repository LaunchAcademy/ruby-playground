require_relative '../lib/item'

describe Item do
  let(:item) { Item.new("Magnifying Glass", "Spys-R-Us", 5.75, "Great for inspecting clues.") }

  let(:item_without_description) { Item.new("Spy Notebook", "Spys-R-Us", 10.50) }

  it 'has a name' do
    expect(item.name).to eq("Magnifying Glass")
  end

  it 'has a manufacturer' do
    expect(item.manufacturer).to eq("Spys-R-Us")
  end

  it 'has a price' do
    expect(item.price).to eq(5.75)
  end

  it 'has an optional description' do
    expect(item.description).to eq("Great for inspecting clues.")
    expect(item_without_description.description).to eq(nil)
  end

  describe '#summary' do
    it 'returns summary information with a description' do
      expected_summary = %q(Name: Magnifying Glass
Description: Great for inspecting clues.
Manufacturer: Spys-R-Us
Price: $5.75)

      expect(item.summary).to eq(expected_summary)
    end

    it 'returns summary information without a description' do
      expected_summary = %q(Name: Spy Notebook
Manufacturer: Spys-R-Us
Price: $10.50)

      expect(item_without_description.summary).to eq(expected_summary)
    end
  end
end
