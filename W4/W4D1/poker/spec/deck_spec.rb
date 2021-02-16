require "rspec"
require "deck"

describe Deck do

  describe "initialize" do
    subject(:deck) { Deck.new }
      it "should initialize a deck of 52 cards" do
        expect(:deck.length).to eq(52)
      end
  end
end