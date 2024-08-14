require_relative "lib/mastermind"
require "colorize"

print "Welcome to "
puts "Mastermind".colorize(:red)
puts "The goal of the game is to guess a secret code in less than 12 tries"

mastermind = Mastermind.new

x = 0
while x < 12
  guess = gets.chomp

  if mastermind.good_guess?(guess) == true
    puts "Congratulations! You've guessed the correct code.".colorize(:green)
    break
  else
    info = mastermind.good_guess?(guess)
    puts "You have #{info[0]} digits in the correct position and #{info[1]} correct digits in the wrong position.".colorize(:blue) # rubocop:disable Layout/LineLength
  end
  x += 1
end
