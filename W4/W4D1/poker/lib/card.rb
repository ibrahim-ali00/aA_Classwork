class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value  #[ "A", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    @suit = suit  #[:Spades, :Diamonds, :Clubs, :Hearts]
  end
end