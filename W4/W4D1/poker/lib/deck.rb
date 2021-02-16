class Deck
  attr_reader :deck

  def self.generate
    values = [ "A", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = [:spades, :diamonds, :clubs, :hearts]
    results = []
    
    values.each do |value|
      suits.each do |suit|
        results << [value, suit]
      end
    end
    results
  end

  def initialize
    @deck = Deck.generate
  end

end