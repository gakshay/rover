#!/usr/bin/env ruby -KU

require "rubygems"
require File.dirname(__FILE__) + '/plateau.rb'
require File.dirname(__FILE__) + '/navigation.rb'
require File.dirname(__FILE__) + '/movement.rb'

class Rover
  # x co-ordinate, y-co-ordinate, o-orientation, sequence to store the movement on each instruction
  attr_accessor :x, :y, :o, :sequence
  
  def initialize(xyo)
    raise "ERROR: plateau area not initialzed" unless $X && $Y
    x, y, o = xyo.chomp.scan(/\w+/)
    unless x.to_i && y.to_i && o && Navigation::HEAD.include?(o.upcase)
      raise "ERROR: wrong input USAGE: 1 2 N"
    end
    if Plateau.valid_position?(x.to_i, y.to_i)
      @x, @y, @o = x.to_i, y.to_i, o.upcase
      @sequence = []
      @sequence << [@x, @y, @o]
      @move = Movement.new(x.to_i, y.to_i, o.upcase)
    else
      raise "ERROR: Invalid Position(#{x}, #{y}) must be inside [#{$X},#{$Y}]"
    end
  end
  
  # input: "LMLMMLMLMLRR"
  # returns: final position of the rover or error message
  def explore(instructions)
    instructions = instructions.upcase
    instructions.each_char { |instruction|
      case instruction
        when /(L|R)/
          self.sequence << @move.rotate(instruction)
        when 'M'
          self.sequence << @move.forward
        else 
          self.sequence << "ERROR: wrong input #{instruction}, [USAGE: L/R/M]"
      end
    }
    final_position
  end
  
  
  private
  
  # method that reads the last element of the sequence steps array
  def final_position
    final = self.sequence.last
    if final.is_a? Array
      final.join(" ")
    else
      final
    end
  end
  
  # method to reset the position of rover at any point of time
  def reset
    self.x, self.y, self.o = self.sequence.first
  end
end # Rover class end
