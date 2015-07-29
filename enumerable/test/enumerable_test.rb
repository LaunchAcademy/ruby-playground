require_relative "../lib/enumerable"

describe "enumerable" do

  before :each do
    Enumerable.instance_methods.each do |method|
      expect(numbers).to_not receive(method)
    end
  end

  let(:numbers) { [5, 2, 8, 1] }

  describe "map" do
    it "converts every element in an array" do
      result = map(numbers) { |x| x * x }
      expect(result).to eq([25, 4, 64, 1])
    end

    it "works for empty arrays" do
      result = map([]) { |x| x * x }
      expect(result).to eq([])
    end

    it "does not modify the original array" do
      map(numbers) { |x| x * x }
      expect(numbers).to eq([5, 2, 8, 1])
    end
  end

  describe "filter" do
    it "removes values that don't meet the supplied condition" do
      result = filter(numbers) { |num| num < 5 }
      expect(result).to eq([2, 1])
    end

    it "does not modify the original array" do
      filter(numbers) { |num| num < 5 }
      expect(numbers).to eq([5, 2, 8, 1])
    end

    it "returns an empty array if no elements match" do
      result = filter(numbers) { |num| num > 100 }
      expect(result).to eq([])
    end

    it "works on empty arrays" do
      result = filter([]) { |num| num > 100 }
      expect(result).to eq([])
    end
  end

  describe "any?" do
    it "returns true if any elements match the given condition" do
      result = any?(numbers) { |num| num > 5 }
      expect(result).to eq(true)
    end

    it "returns false if no elements match the condition" do
      result = any?(numbers) { |num| num < 0 }
      expect(result).to eq(false)
    end
  end

  describe "reduce" do
    it "accumulates a value" do
      sum = reduce(numbers, 0) { |sum, x| sum + x }
      expect(sum).to eq(16)

      product = reduce(numbers, 1) { |product, x| product * x }
      expect(product).to eq(80)
    end

    it "initializes with the first value if none provided" do
      sum = reduce(numbers) { |sum, x| sum + x }
      expect(sum).to eq(16)

      product = reduce(numbers) { |product, x| product * x }
      expect(product).to eq(80)
    end

    it "works for empty array" do
      sum = reduce([], 0) { |sum, x| sum + x }
      expect(sum).to eq(0)

      sum = reduce([]) { |sum, x| sum + x }
      expect(sum).to eq(nil)
    end
  end

end
