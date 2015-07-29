require_relative '../lib/sum_of_integers'

describe "#sum" do
  it "sums up a file of integers" do
    sample_file = File.join(File.dirname(__FILE__), 'integers.txt')
    expect(sum(sample_file)).to eq 55
  end
end
