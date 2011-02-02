#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/lib/rover.rb'

puts "Enter the upper-right coordinates of the plateau (USAGE: 5 5)"
area = gets.chomp
p = Plateau.new(area)
puts "======Plateau initialized========"
puts "Enter the first rover's position(1 2 N)"
r1p = gets.chomp
r1 = Rover.new(r1p)
puts "First rover's series of instructions (LMLMLMLMM)"
r1s = gets.chomp
r1_final = r1.explore(r1s)
puts r1.sequence.inspect

puts "Enter the second rover's position(3 3 E)"
r2p = gets.chomp
r2 = Rover.new(r2p)
puts "Second rover's series of instructions (MMRMMRMRRM)"
r2s = gets.chomp
r2_final = r2.explore(r2s)
puts r2.sequence.inspect

puts "==============First rover's final position========="
puts r1_final
puts "==============Second rover's final position========"
puts r2_final
puts "==========================================="

