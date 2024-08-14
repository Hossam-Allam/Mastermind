# Class responsible for code generation
class Mastermind
  attr_accessor :code

  def initialize
    @code = [1, 2, 3, 4]
    # @code = (0...4).map { rand(1..6) }
  end

  def good_guess?(guess)
    guess_arr = guess.chars.map(&:to_i) # Convert string to an array of integers

    return true if winner?(guess_arr)

    correct = correct?(guess_arr)
    partial = partially_correct?(guess_arr)
    "You have #{correct} digits in the correct position and #{partial} correct digits in the wrong position."
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

  def partially_correct?(guess)
    copy_code = @code.dup
    partial = 0
    @code.each_with_index do |val, index|
      copy_code[index] = nil if @code[index] == guess[index]
    end

    guess.each { |val| partial += 1 if copy_code.include?(val) }
    partial
  end
end
