require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_1)
    p "Exact matches: #{@secret_code.num_exact_matches(code_1)}"
    p "Near matches: #{@secret_code.num_near_matches(code_1)}"
  end

  def ask_user_for_guess
    p "Enter a code"
    input = gets.chomp

    print_matches(Code.from_string(input))
    @secret_code == Code.from_string(input)
  end

end
