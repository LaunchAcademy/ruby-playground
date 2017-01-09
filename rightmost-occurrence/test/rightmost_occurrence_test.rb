require_relative '../lib/rightmost_occurrence'

describe "#rightmost_occurrence" do
  it "returns nil if no matches are found" do
    expect(rightmost_occurrence('abc', 'x')).to eq nil
  end

  it "returns the correct index when is only character" do
    expect(rightmost_occurrence('t', 't')).to eq 0
  end

  it "returns the correct index when is in middle of string" do
    expect(rightmost_occurrence('cat dog', 'd')).to eq 4
  end

  it "returns the correct index when char occurs more than once" do
    expect(rightmost_occurrence('cat dog tutu', 't')).to eq 10
  end

  it "is not case sensitive" do
    expect(rightmost_occurrence('Sometimes I like yOu', 'o')).to eq 18
  end
end
