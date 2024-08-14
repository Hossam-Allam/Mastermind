require_relative "lib/mastermind"
require "colorize"

puts "Welcome to Mastermind".colorize(:red)
puts "The goal of the game is to guess a secret code in less than 12 tries"

mastermind = Mastermind.new

x = 0
while x < 12
  guess = gets.chomp

  if mastermind.good_guess?(guess) == true
    puts "Congratulations! You've guessed the correct code.".colorize(:green)
    break
  else
    puts mastermind.good_guess?(guess).colorize(:blue)
  end
  x += 1
end
