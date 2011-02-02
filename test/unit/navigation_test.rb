#!/usr/bin/env ruby -KU

require File.dirname(__FILE__) + '/../test_helper'

class NavigationTest < Test::Unit::TestCase
  
  def test_next_position
     assert_equal [1,2], Navigation.next_position(1, 1, 'N')
     assert_not_equal [2,1], Navigation.next_position(1, 1, 'N')
     assert_equal [3,2], Navigation.next_position(2, 2, 'E')
     assert_equal [0,1], Navigation.next_position(1, 1, 'W')
     assert_equal [1,0], Navigation.next_position(1, 1, 'S')
  end
  
  def test_valid_head_position
    assert_equal true, Navigation.valid?('n')
    assert_equal true, Navigation.valid?('e')
    assert_equal true, Navigation.valid?('w')
    assert_equal true, Navigation.valid?('s')
    assert_equal false, Navigation.valid?('p')
    assert_not_equal true, Navigation.valid?('P')  
  end 
  
  def test_left_of_north_is_west
    assert_equal 'W', Navigation::HEAD['N'][0]
    assert_not_equal 'W', Navigation::HEAD['N'][1]
    assert_equal 'W', Navigation.rotate_left('N')
    assert_not_equal 'W', Navigation.rotate_right('N')
  end
  
  def test_right_of_north_is_east
    assert_equal 'E', Navigation::HEAD['N'][1]
    assert_not_equal 'E', Navigation::HEAD['N'][0]
    assert_not_equal 'E', Navigation.rotate_left('N')
    assert_equal 'E', Navigation.rotate_right('N')
  end
  
  def test_left_of_east_is_north
    assert_equal 'N', Navigation::HEAD['E'][0]
    assert_not_equal 'N', Navigation::HEAD['E'][1]
    assert_not_equal 'N', Navigation.rotate_right('E')
    assert_equal 'N', Navigation.rotate_left('E')
  end
  
  def test_right_of_east_is_south
    assert_equal 'S', Navigation::HEAD['E'][1]
    assert_not_equal 'S', Navigation::HEAD['E'][0]
    assert_not_equal 'S', Navigation.rotate_left('E')
    assert_equal 'S', Navigation.rotate_right('E')
  end
  
  def test_left_of_west_is_south
    assert_equal 'S', Navigation::HEAD['W'][0]
    assert_not_equal 'S', Navigation::HEAD['W'][1]
    assert_not_equal 'S', Navigation.rotate_right('W')
    assert_equal 'S', Navigation.rotate_left('W')
  end
  
  def test_right_of_west_is_north
    assert_equal 'N', Navigation::HEAD['W'][1]
    assert_not_equal 'N', Navigation::HEAD['W'][0]
    assert_not_equal 'N', Navigation.rotate_left('W')
    assert_equal 'N', Navigation.rotate_right('W')
  end
  
  def test_left_of_south_is_east
    assert_equal 'E', Navigation::HEAD['S'][0]
    assert_not_equal 'E', Navigation::HEAD['S'][1]
    assert_not_equal 'E', Navigation.rotate_right('S')
    assert_equal 'E', Navigation.rotate_left('S')
  end
  
  def test_right_of_south_is_west
    assert_equal 'W', Navigation::HEAD['S'][1]
    assert_not_equal 'W', Navigation::HEAD['S'][0]
    assert_not_equal 'W', Navigation.rotate_left('S')
    assert_equal 'W', Navigation.rotate_right('S')
  end
  
end # RoverTest end