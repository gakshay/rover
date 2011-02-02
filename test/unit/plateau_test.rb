#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/../test_helper'

class PlateauTest < Test::Unit::TestCase
  
  def setup
    Plateau.new("5 5")
  end
  
  def test_plateau_area_should_initialize
    Plateau.new("10 5")
    assert_equal 10, $X
    assert_equal 5, $Y
  end
  
  def test_plateau_raise_error_on_invalid_plateau_position
    assert_raise(RuntimeError){ Plateau.new("2 S")}
    assert_raise(RuntimeError){ Plateau.new("P 5")}
  end
  
  def test_plateau_validate_current_position_within_range
    setup
    p = Plateau.valid_position?(1,4)
    assert p
    p = Plateau.valid_position?(4, 4)
    assert p
  end
  
  def test_plateau_fail_when_current_position_is_out_of_range
    setup
    p = Plateau.valid_position?(1,40)
    assert_equal false, p
  end
  
end # PlateauTest end