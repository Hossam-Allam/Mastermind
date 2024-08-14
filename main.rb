require_relative "lib/mastermind"
require "colorize"
require "io/console"

def clear_console
  if Gem.win_platform?
    system("cls") # Clear console on Windows
  else
    system("clear") # Clear console on Unix-like systems
  end
end

print "Welcome to "
puts "Mastermind".colorize(:red)
puts "The goal of the game is to guess a secret code in less than 12 tries"
puts "Numbers in the code range from 1 to 6 and the code is 4 digits".colorize(:yellow)

print "Is this a two-player game? (yes/no): "
is_two_player = gets.chomp.downcase == "yes"

mastermind = if is_two_player
               print "Player 1, please enter the code (4 digits between 1 and 6): "
               code = gets.chomp
               clear_console
               Mastermind.new(code)
             else
               Mastermind.new
             end

puts "Enter your first guess".colorize(:magenta)

x = 0
while x < 12
  guess = gets.chomp
  if guess.length != 4 || !guess.chars.all? { |char| char.to_i.between?(1, 6) }
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
