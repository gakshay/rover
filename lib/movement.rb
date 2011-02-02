#!/usr/bin/env ruby -KU

require 'rubygems'
require File.dirname(__FILE__) + '/plateau.rb'
require File.dirname(__FILE__) + '/navigation.rb'

class Movement
  attr_accessor :x, :y, :head
  def initialize(x, y, head)
    @x, @y, @head = x.to_i, y.to_i, head.upcase
  end

  def rotate(direction)
    case direction
      when "L"
        self.head = Navigation.rotate_left(self.head)
        [self.x, self.y, self.head]
      when "R"
        self.head = Navigation.rotate_right(self.head)
        [self.x, self.y, self.head]
      else
        return "ERROR: Invalid Rotation #{direction} USAGE: [L/R]"
    end
  end

     
  # method to store the next valid move of the rover else ERROR returned
  def move()
    next_x, next_y = Navigation.next_position(self.x, self.y, self.head)
    if Plateau.valid_position?(next_x, next_y)
      self.x, self.y = next_x, next_y
      [self.x, self.y, self.head]
    else
      return "Error: out of scope move [#{next_x}, #{next_y}]"
    end
  end
  
end # movement class end
