require "tdd.rb"

describe "#my_uniq" do
  let(:array) { [1, 2, 1, 3, 3] }

  # Check if array is passed
  #   it "takes in an array as a parameter" do
  #     expect(my_uniq(array)) do |arg|
  #       expect(arg).to be_a Array
  #     end
  #   end

  # Monkeypatched version
  #   it "takes in an array as a parameter" do
  #     expect { [1, 2, 3].my_uniq }.to_not raise_error
  #     expect { 1.my_uniq }.to raise_error(NoMethodError)
  #   end

  it "should remove duplicates from an array" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end

  it "should create a new array" do
    my_uniq(array)
    expect(array).to eq([1, 2, 1, 3, 3])
  end
end

describe Array do
  describe "#two_sum" do
    let(:arr_1) { [-1, 0, 2, -2, 1] }
    let(:arr_2) { [-1, 0, 2, -2, 1].two_sum }

    it "should return sorted pairs of indices where the sum equals to zero" do
      expect(arr_1.two_sum).to eq([[0, 4], [2, 3]])
    end
    it "should sort array of pairs 'dictionary-wise'" do
      expect(arr_2).to eq(arr_2.sort)
    end
  end
end

describe "#my_transpose" do
  let(:rows) {
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
    ]
  }
  let(:cols) {
    [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
    ]
  }

  it "converts rows to columns and vice-versa" do
    expect(my_transpose(rows)).to eq(cols)

    expect(my_transpose(cols)).to eq(rows)
  end
end

describe "#stock_picker" do
  let(:stocks) { [1, 13, 2, 24, 32, 9, 91, 11] }
  it "outputs the most profitable pair of days on which to buy and sell the stock" do
    expect(stock_picker(stocks)).to eq([1, 7])
  end
end

describe Hanoi do
  subject(:towers) { Hanoi.new }
  describe "#initialize" do
    it "should initialize the default board state" do
      expect(towers.board).to eq([[3, 2, 1], [], []])
    end
  end
  describe "#won?" do
    it "should check if the game is won" do
      expect(towers.board).to eq([[], [], [3, 2, 1]])
    end
  end
end

# [[3, 2, 1],[],[]]
# [[3, 2],[1],[]]
# Won
# [[], [], [3, 2, 1]]
