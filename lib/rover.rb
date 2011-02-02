#!/usr/bin/env ruby -KU

require "rubygems"
require File.dirname(__FILE__) + '/plateau.rb'

class Rover
  # x co-ordinate, y-co-ordinate, o-orientation, sequence to store the movement on each instruction
  attr_accessor :x, :y, :o, :sequence
  
  def initialize(xyo)
    raise "ERROR: plateau area not initialzed" unless $X && $Y
    x, y, o = xyo.chomp.scan(/\w+/)
    unless x.to_i && y.to_i && o && HEAD.include?(o.upcase)
      raise "ERROR: wrong input USAGE: 1 2 N"
    end
    if Plateau.valid_position?(x.to_i, y.to_i)
      @x, @y, @o = x.to_i, y.to_i, o.upcase
      @sequence = []
      @sequence << [@x, @y, @o]
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
          self.sequence << Movement.rotate(instruction)
        when 'M'
          self.sequence << Movement.forward
        else 
          self.sequence << "ERROR: wrong input #{instruction}, [USAGE: L/R/M]"
          break
      end
    }
    #final_position
  end
  
  
  private
  
  # method to rotate the rover head LEFT/RIGHT on the same position
  def rotate(direction)
    case direction
      when "left"
        self.o = HEAD[self.o][0]
        self.sequence << [self.x, self.y, self.o]
      when "right"
        self.o = HEAD[self.o][1]
        self.sequence << [self.x, self.y, self.o]
      else
        self.sequence << "ERROR: Invalid Rotation. USAGE: left/right"
        return false
    end
  end
  
  # method to store the next valid move of the rover else ERROR stored in the sequence
  def next_move()
    next_x, next_y = next_position(self.x, self.y, self.o)
    if Plateau.valid_position?(next_x, next_y)
      self.x, self.y = next_x, next_y
      self.sequence << [self.x, self.y, self.o]
    else
      self.sequence << "Error: out of scope move [#{next_x}, #{next_y}]"
      return false
    end
  end

  # method to calculate the next position of the rover based on head orientation
  # it doesn't take care wheather the position is valid or not
  def next_position(x, y, o)
    if Plateau.valid_position?(x,y)
      case o
        when 'N'
          return [x, y+1]
        when 'E'
          return [x+1, y]
        when 'W'
          return [x-1, y]
        when 'S'
          return [x, y-1]
      end
    end
  end  
  
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
