require_relative '../lib/order'

describe Order do
  before :each do
    @order = Order.new("12/10/2014", "Gene Parmesan", "PayPal",
      "100 Spy Street, Newport Beach, CA 92625")

    @order.items << Item.new("Magnifying Glass","Spys-R-Us",
      5.75, "Great for inspecting clues.")

    @order.items << Item.new("Spy Notebook", "Spys-R-Us", 10.50)
  end

  describe '#total' do
    it 'returns the total cost of the items' do
      expect(@order.total).to eq(16.25)
    end
  end

  describe '#summary' do
    it 'returns summary information' do
      expected_summary = %q(Date: 12/10/2014
Customer: Gene Parmesan
Payment method: PayPal
Shipping address: 100 Spy Street, Newport Beach, CA 92625

Items:

Name: Magnifying Glass
Description: Great for inspecting clues.
Manufacturer: Spys-R-Us
Price: $5.75

Name: Spy Notebook
Manufacturer: Spys-R-Us
Price: $10.50

Total: $16.25)
      expect(@order.summary).to eq(expected_summary)
    end
  end
end
