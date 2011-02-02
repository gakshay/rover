#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/lib/rover.rb'

puts "Enter the upper-right coordinates of the plateau (USAGE: 5 5)"
plateau = gets.chomp
p = Plateau.new(plateau)
puts "Enter the first rover's position(1 2 N)"
rover1 = Rover.new(gets.chomp)
puts "First rover's series of instructions (LMLMLMLMM)"
rover1_result = rover1.explore(gets.chomp)
puts rover1.sequence.inspect

puts "Enter the second rover's position(3 3 E)"
rover2 = Rover.new(gets.chomp)
puts "Second rover's series of instructions (MMRMMRMRRM)"
rover2_result = rover2.explore(gets.chomp)
puts rover2.sequence.inspect

puts "======"
puts rover1_result
puts rover2_result
puts "======"

