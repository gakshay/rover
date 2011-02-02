#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/../test_helper'

class PlateauTest < Test::Unit::TestCase
  
  def setup
    Plateau.new("5 5")
  end
  
  def test_left_of_north_is_west
    assert_equal 'W', HEAD['N'][0]
    assert_not_equal 'W', HEAD['N'][1]
  end
  
  def test_right_of_north_is_east
    assert_equal 'E', HEAD['N'][1]
    assert_not_equal 'E', HEAD['N'][0]
  end
  
  def test_left_of_east_is_north
    assert_equal 'N', HEAD['E'][0]
    assert_not_equal 'N', HEAD['E'][1]
  end
  
  def test_right_of_east_is_south
    assert_equal 'S', HEAD['E'][1]
    assert_not_equal 'S', HEAD['E'][0]
  end
  
  def test_left_of_west_is_south
    assert_equal 'S', HEAD['W'][0]
    assert_not_equal 'S', HEAD['W'][1]
  end
  
  def test_right_of_west_is_north
    assert_equal 'N', HEAD['W'][1]
    assert_not_equal 'N', HEAD['W'][0]
  end
  
  def test_left_of_south_is_east
    assert_equal 'E', HEAD['S'][0]
    assert_not_equal 'E', HEAD['S'][1]
  end
  
  def test_right_of_south_is_west
    assert_equal 'W', HEAD['S'][1]
    assert_not_equal 'W', HEAD['S'][0]
  end
  
  def test_plateau_area_should_initialize
    Plateau.new("10 5")
    assert_equal 10, $X
    assert_equal 5, $Y
  end
  
  def test_should_raise_on_invalid_plateau_position
    assert_raise(RuntimeError){ Plateau.new("2 S")}
    assert_raise(RuntimeError){ Plateau.new("P 5")}
  end
  
  def test_should_validate_current_position_within_range
    setup
    p = Plateau.valid_position?(1,4)
    assert p
    p = Plateau.valid_position?(4, 4)
    assert p
  end
  
  def test_should_fail_when_current_position_is_out_of_range
    setup
    p = Plateau.valid_position?(1,40)
    assert_equal false, p
  end
  
end # RoverTest end