require "minitest"
require "minitest/autorun"
require "./custom_array"
class CustomArrayTest < Minitest::Test
  def test_it_leaves_single_level_alone
    assert_equal [1,2,3], CustomArray.new([1,2,3]).flatten
  end

  def test_it_flattens_two_levels
    assert_equal [1,2,3], CustomArray.new([1,2,[3]]).flatten
  end

  def test_it_flattens_three_levels
    assert_equal [1,2,3,4], CustomArray.new([1,2,[[3], 4]]).flatten
    assert_equal [1,2,2.5,3,4], CustomArray.new([1,[2], [[[2.5]]],[[3], 4]]).flatten
  end

  def test_it_flattens_with_monkey_patching
    assert_equal [1,2,3,4], CustomArray.new([1,2,[[3], 4]]).monkey_flatten
    assert_equal [1,2,2.5,3,4], CustomArray.new([1,[2], [[[2.5]]],[[3], 4]]).monkey_flatten
  end

  def test_it_flattens_with_loop_flatten
    assert_equal [1,2,3,4], CustomArray.new([1,2,[[3], 4]]).loop_flatten
    assert_equal [1,2,2.5,3,4], CustomArray.new([1,[2], [[[2.5]]],[[3], 4]]).loop_flatten
  end

  def test_brandon_and_justin
    assert_equal [1,2,3,4], CustomArray.new([1,2,[[3], 4]]).brandon_flatten
    assert_equal [1,2,2.5,3,4], CustomArray.new([1,[2], [[[2.5]]],[[3], 4]]).brandon_flatten
  end

  def test_josh_and_konr
    assert_equal [1,2,3,4], CustomArray.new([1,2,[[3], 4]]).josh_konr
    assert_equal [1,2,2.5,3,4], CustomArray.new([1,[2], [[[2.5]]],[[3], 4]]).josh_konr
  end
end
