#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/../test_helper'

class RoverTest < Test::Unit::TestCase
  
  def setup
    p = Plateau.new("5 5")
    @rover1 = Rover.new("1 2 N")
    @rover2 = Rover.new("3 3 E")
  end
  
  def test_should_initialize_first_rover
    assert_equal 1, @rover1.x
    assert_equal 2, @rover1.y
    assert_equal 'N', @rover1.o
  end
  
  def test_should_read_instruction_set_for_first_rover
    r1_final = @rover1.explore("LMLMLMLMM")
    assert_equal "1 3 N", r1_final
    assert_instance_of Array, @rover1.sequence.last
  end
  
  def test_should_initialize_second_rover
    assert_equal 3, @rover2.x
    assert_equal 3, @rover2.y
    assert_equal 'E', @rover2.o
  end
  
  def test_should_read_instruction_set_for_second_rover
    r2_final = @rover2.explore("MMRMMRMRRM")
    assert_instance_of Array, @rover1.sequence.last
    assert_equal "5 1 E", r2_final
  end
  
  def test_should_fail_when_position_out_of_scope
    @rover1.explore("MMMM")
    assert_instance_of String, @rover1.sequence.last
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