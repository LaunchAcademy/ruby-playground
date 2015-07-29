require_relative '../lib/shakespeare'

describe "#word_frequency" do
  it "outputs the frequency that each word appears" do
    sample_file = File.join(File.dirname(__FILE__), 'hamlet.txt')

    frequency = word_frequency(sample_file)

    expect(frequency["bernardo"]).to eq 30
    expect(frequency["jelly"]).to eq 1
    expect(frequency["excellent"]).to eq 10
  end
end
