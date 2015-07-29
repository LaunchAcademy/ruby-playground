require_relative '../lib/armstrong_numbers'

describe "#armstrong_number?" do
  it "correctly identifies armstrong numbers of length 1" do
    0.upto(9) do |n|
      expect(armstrong_number?(n)).to eq true
    end
  end

  it "correctly identifies non-armstrong numbers of length 2" do
    10.upto(99) do |n|
      expect(armstrong_number?(n)).to eq false
    end
  end

  it "correctly identifies armstrong numbers of length 3" do
    expect(armstrong_number?(153)).to eq true
    expect(armstrong_number?(370)).to eq true
    expect(armstrong_number?(371)).to eq true
  end

  it "correctly identifies non-armstrong numbers of length 3" do
    expect(armstrong_number?(302)).to eq false
    expect(armstrong_number?(404)).to eq false
    expect(armstrong_number?(418)).to eq false
    expect(armstrong_number?(500)).to eq false
  end

  it "correctly identifies armstrong numbers of length 5" do
    expect(armstrong_number?(54748)).to eq true
    expect(armstrong_number?(92727)).to eq true
    expect(armstrong_number?(93084)).to eq true
  end

  it "correctly identifies non-armstrong numbers of length 5" do
    expect(armstrong_number?(30278)).to eq false
    expect(armstrong_number?(40465)).to eq false
    expect(armstrong_number?(50035)).to eq false
  end
end
