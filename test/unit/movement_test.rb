#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/../test_helper'

class MovementTest < Test::Unit::TestCase
  
  def setup
    p = Plateau.new("5 5")
    @position = Movement.new(1, 2, "N")
  end
  
  def test_should_initialize_current_position
    assert_equal 1, @position.x
    assert_equal 2, @position.y
    assert_equal 'N', @position.head
  end
  
  def test_rotation_direction_and_current_position
    setup
    x,y,h = @position.rotate("L")
    assert_equal [1,2,'W'], [x,y,h]
    assert_equal 'W', @position.head
    assert_not_equal 'N', @position.head
    
    x,y,h = @position.rotate("R")
    assert_equal [1,2,'N'], [x,y,h]
    assert_equal 'N', @position.head
    assert_not_equal 'W', @position.head
    
  end
  
  def test_next_move_and_current_position
    setup
    x,y,h = @position.move
    assert_equal [1,3,'N'], [x,y,h]
    assert_equal 1, @position.x
    assert_equal 3, @position.y
    assert_equal 'N', @position.head
    assert_not_equal 'W', @position.head 
  end
  
end # RoverTest end