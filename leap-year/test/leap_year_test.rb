require_relative '../lib/leap_year'

describe "#leap_year?" do
  it "identifies year is a leap year" do
    expect(leap_year?(2016)).to eq true
  end

  it "identifies year is not a leap year" do
    expect(leap_year?(2014)).to eq false
  end

  it "identifies when century is not a leap year" do
    expect(leap_year?(2100)).to eq false
  end

  it "identifies when century is a leap year" do
    expect(leap_year?(2000)).to eq true
  end
end
