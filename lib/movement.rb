#!/usr/bin/env ruby -KU

require 'rubygems'
require File.dirname(__FILE__) + '/plateau.rb'
require File.dirname(__FILE__) + '/navigation.rb'

class Movement
  attr_accessor :x, :y, :o, :sequence
  def initialize(x, y, o)
    @x, @y, @o = x, y, o
  end

  def rotate(direction)
    case direction
      when "L"
        self.o = Navigation::HEAD[self.o][0]
        return [self.x, self.y, self.o]
      when "R"
        self.o = Navigation::HEAD[self.o][1]
        return [self.x, self.y, self.o]
      else
        return "ERROR: Invalid Rotation. USAGE: left/right"
    end
  end

     
  # method to store the next valid move of the rover else ERROR returned
  def forward()
    next_x, next_y = next_position
    if Plateau.valid_position?(next_x, next_y)
      self.x, self.y = next_x, next_y
      return [self.x, self.y, self.o]
    else
      return "Error: out of scope move [#{next_x}, #{next_y}]"
    end
  end

  # method to calculate the next position of the rover based on head orientation
  # it doesn't take care wheather the position is valid or not
  def next_position
    if Plateau.valid_position?(self.x, self.y)
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
end
