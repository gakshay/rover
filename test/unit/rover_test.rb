#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/../test_helper'

class RoverTest < Test::Unit::TestCase
  
  def setup
    p = Area.new("5 5")
    @r1 = Rover.new("1 2 N")
    @r2 = Rover.new("3 3 E")
  end
  
  def test_should_initialize_first_rover
    assert_equal 1, @r1.x
    assert_equal 2, @r1.y
    assert_equal 'N', @r1.o
  end
  
  def test_should_read_instruction_set_for_first_rover
    r1_final = @r1.explore("LMLMLMLMM")
    assert_equal "1 3 N", r1_final
    assert_instance_of Array, @r1.sequence.last
  end
  
  def test_should_initialize_second_rover
    assert_equal 3, @r2.x
    assert_equal 3, @r2.y
    assert_equal 'E', @r2.o
  end
  
  def test_should_read_instruction_set_for_second_rover
    r2_final = @r2.explore("MMRMMRMRRM")
    assert_instance_of Array, @r1.sequence.last
    assert_equal "5 1 E", r2_final
  end
  
  def test_should_fail_when_position_out_of_scope
    @r1.explore("MMMM")
    assert_instance_of String, @r1.sequence.last
  end
  
  def test_should_raise_exception_if_plateau_not_initialzed
    $X, $Y = 0, 0
    assert_raise(RuntimeError){ Rover.new("1 2 N")}
  end
  
  def test_should_raise_exception_when_wrong_orientation_or_coordinates_are_given
    setup
    assert_raise(RuntimeError){ Rover.new("1 2 J")}
    assert_raise(RuntimeError){ Rover.new("1 T J")}
    assert_raise(RuntimeError){ Rover.new("p 2 J")}
  end
  
  def test_should_raise_on_invalid_positions_of_rover
    setup
    assert_raise(RuntimeError){ Rover.new("1 9 N")}
    assert_raise(RuntimeError){ Rover.new("7 2 N")}
  end
  
end # RoverTest end