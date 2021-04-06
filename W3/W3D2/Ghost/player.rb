class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    input = gets.chomp
  end

  def alert_invalid_guess(str)
    if !str.guess.is_a?(String) || str.length > 1
      raise "Error invalid play"
    end
  end
end
