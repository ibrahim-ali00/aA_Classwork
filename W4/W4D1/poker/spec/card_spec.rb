require "rspec"
require "card.rb"

describe Card do
  describe "Card#initialize" do
    subject(:card) { Card.new("A", :Hearts)}

    it "creates a card instance" do
      expect(card.value).to eq("A")
      expect(card.suit).to eq(:Hearts)
    end
  end
end