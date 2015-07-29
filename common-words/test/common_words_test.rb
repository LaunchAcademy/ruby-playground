require_relative "../lib/common_words"

describe "common words" do
  it "returns most common word" do
    input = "a short list of words with some words"

    expect(most_common(input)).to eq ["words"]
  end

  it "ignores case of letters and punctuation when return most common word" do
    input = "Words in a short, short words, lists of words!"

    expect(most_common(input)).to eq ["words"]
  end

  it "returns most common words if there are ties" do
    input = "a short list of words with some short words in it"

    expect(most_common(input)).to include "words"
    expect(most_common(input)).to include "short"
  end
end
