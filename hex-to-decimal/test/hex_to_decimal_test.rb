require_relative '../lib/hex_to_decimal'

describe "#hex_to_decimal" do
  it "converts single number from hex to decimal" do
    expect(hex_to_decimal('9')).to eq 9
  end

  it "converts single letter from hex to decimal" do
    expect(hex_to_decimal('E')).to eq 14
  end

  it "converts multiple numbers" do
    expect(hex_to_decimal('5A')).to eq 90
  end

  it "converts multiple letters" do
    expect(hex_to_decimal('CC')).to eq 204
  end

  it "converts multiple numbers and letters" do
    expect(hex_to_decimal('1A2B3C')).to eq 1715004
  end

  it "is case insensitive" do
    expect(hex_to_decimal('1a2b3c')).to eq 1715004
  end
end
