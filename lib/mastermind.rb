# Class responsible for code generation
class Mastermind
  attr_accessor :code

  def initialize
    # @code = (0...4).map { rand(1..6) }
    @code = [1, 2, 3, 4]
  end

  def good_guess?(guess)
    guess_arr = guess.chars.map(&:to_i) # Convert string to an array of integers

    if winner?(guess_arr)
      "Congratulations! You've guessed the correct code."
    else
      correct = correct?(guess_arr)
      "You have #{correct} digits in the correct position."
    end
  end

  private

  def winner?(guess)
    (0...4).all? { |i| @code[i] == guess[i] }
  end

  def correct?(guess)
    correct = 0
    @code.each_with_index do |_val, index|
      correct += 1 if @code[index] == guess[index]
    end
    correct
  end
end
