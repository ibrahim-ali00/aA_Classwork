require "first_tdd"
require "rspec"

describe "my_uniq" do
  it "remove dupes" do
    # let(:array) { [1, 2, 1, 3, 3] }
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end
end

describe "two_sum" do
  it "returns all possibles that sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
  it "must be in order" do
    expect([-1, 0, 2, -2, 1].two_sum).not_to eq([[2, 3], [0, 4]])
  end
end

describe "my_transpose" do
  it "should reverse rows, cols" do
    array = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
    expected = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    expect(my_transpose(array)).to eq(expected)
  end
end

describe "stock_picker" do
  it "should find the best day to buy and best day to sell the stock" do
    array = [6, 4, 3, 5, 2, 7, 9]
    expected = [4, 6]
    expect(stock_picker(array)).to eq(expected)
  end
end
