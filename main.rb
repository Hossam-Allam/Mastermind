require_relative "lib/mastermind"
require "colorize"

puts "Welcome to Mastermind".colorize(:red)
puts "The goal of the game is to guess a secret code in less than 12 tries"

mastermind = Mastermind.new

guess = gets.chomp

puts mastermind.good_guess?(guess)
