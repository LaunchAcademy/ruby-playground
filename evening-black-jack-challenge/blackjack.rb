require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand(cards)
    # Your code here after writing tests
    # Think about what this method has to be able to do
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_score # Get this working properly
