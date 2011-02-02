#!/usr/bin/env ruby -KU

require 'rubygems'

class Navigation
	HEAD = {"N" => %w(W E),
          "E" => %w(N S),
          "W" => %w(S N),
          "S" => %w(E W)
        }
  
  # to check the orientation is valid or not
  def self.valid?(orientation)
    HEAD.include?(orientation.upcase)
  end
  
  # HEAD position when rotates left from current orientation
  def self.rotate_left(head)
    HEAD[head][0]
  end
  
  # HEAD position when rotates right from current orientation
  def self.rotate_right(head)
    HEAD[head][1]
  end
  
  # the next position based on current x, y co-ordinates
  def self.next_position(x, y, head)
    case head
      when 'N'
        [x, y+1]
      when 'E'
        [x+1, y]
      when 'W'
        [x-1, y]
      when 'S'
        [x, y-1]
    end
  end
  
end # navigation class end
