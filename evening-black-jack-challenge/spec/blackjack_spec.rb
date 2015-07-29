require_relative '../blackjack'

describe Deck do
  let(:deck) { Deck.new } # creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      expect(deck.cards.sort).to_not eq deck.cards      
      # it is good not to rely on negative tests alone 
      # so we assert that after sorting the deck it looks like we expect
      expect(deck.cards.sort[0..1]).to eq ['2♦', '3♦']
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end

# These will be useful for making different hands
# '♦', '♣', '♠', '♥'

describe Hand do
  let(:hand) { Hand.new(["10♦", "J♥"]) }

  describe "#calculate_hand" do
    # Sample tests (change these once you understand)
    it "passes" do
      # use `expect` to test assertions
      expect(1).to eq(1)
    end

    it "fails" do
      expect(false).to eq true
    end
    # add the remaining tests here
  end

  # Break up the bigger method #calculate_hand into smaller methods using more
  # describe blocks.  Each describe block should test 1 method

  describe "#some_other_method" do
    it "passes" do
      expect(true).to_not eq false
    end
  end
end
