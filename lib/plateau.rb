#!/usr/bin/env ruby -KU

require 'rubygems'

# GLOBAL variable to store plateau upper-right coordinates, defaults to 5,5
$X = 5
$Y = 5

class Plateau
  def initialize(xy)
    x,y = xy.chomp.scan(/\d+/)
    unless x.to_i && x.to_i > 0 && y.to_i && y.to_i > 0
      raise "Error: USAGE 5 5"
    end
    $X = x.to_i
    $Y = y.to_i
  end
  
  # class method to validate the position is valid or not
  def self.valid_position?(x, y)
    if (x > $X || x < 0 || y > $Y || y < 0)
      return false
    end
    return true
  end
end # Plateau class end
