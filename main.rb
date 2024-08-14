require_relative "lib/mastermind"
require "colorize"

print "Welcome to "
puts "Mastermind".colorize(:red)
puts "The goal of the game is to guess a secret code in less than 12 tries"
puts "Numbers in the code range from 1 to 6 and the code is 4 digits".colorize(:yellow)
puts "Enter your first guess".colorize(:magenta)

mastermind = Mastermind.new

x = 0
while x < 12
  guess = gets.chomp
  if guess.length != 4
    puts "Enter a valid guess please".colorize(:red)
    x -= 1
  elsif mastermind.good_guess?(guess) == true
    puts "Congratulations! You've guessed the correct code.".colorize(:green)
    break
  else
    info = mastermind.good_guess?(guess)
    puts "You have #{info[0]} digits in the correct position and #{info[1]} correct digits in the wrong position.".colorize(:blue) # rubocop:disable Layout/LineLength
    puts "The code was #{mastermind.code.join}" if x == 11
  end
  x += 1
  puts "Take your guess number #{x + 1}" unless x == 12
end
