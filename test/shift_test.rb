require_relative './test_helper'
require_relative '../lib/shift'

class TestEnigma < Minitest::Test

  def test_shift_shifts
    keys = [2, 27, 71, 15]
    offsets = [1, 0, 2, 5]
    assert_equal [3, 27, 73, 20], Shift.shifts(keys, offsets)
  end

  def test_shift_shift_chars
    characters = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    shifts = [20, 3, 27, 73]
    chars_shifted = {
      0=>{char: "h", encrypt?:  "y", index: 27},
      1=>{char: "e", encrypt?:  "y", index: 7},
      2=>{char: "l", encrypt?:  "y", index: 38},
      3=>{char: "l", encrypt?:  "y", index: 84},
      4=>{char: "o", encrypt?:  "y", index: 34},
      5=>{char: " ", encrypt?:  "y", index: 29},
      6=>{char: "w", encrypt?:  "y", index: 49},
      7=>{char: "o", encrypt?:  "y", index: 87},
      8=>{char: "r", encrypt?:  "y", index: 37},
      9=>{char: "l", encrypt?:  "y", index: 14},
      10=>{char: "d", encrypt?:  "y", index: 30}}
    assert_equal chars_shifted, Shift.shift_chars(characters, shifts)
  end

  def test_shift_char_index
    characters = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    indexed = {0=>{char: "h", encrypt?: "y", index: 7},
      1=>{char: "e", encrypt?: "y", index: 4},
      2=>{char: "l", encrypt?: "y", index: 11},
      3=>{char: "l", encrypt?: "y", index: 11},
      4=>{char: "o", encrypt?: "y", index: 14},
      5=>{char: " ", encrypt?: "y", index: 26},
      6=>{char: "w", encrypt?: "y", index: 22},
      7=>{char: "o", encrypt?: "y", index: 14},
      8=>{char: "r", encrypt?: "y", index: 17},
      9=>{char: "l", encrypt?: "y", index: 11},
      10=>{char: "d", encrypt?: "y", index: 3}}
    assert_equal indexed, Shift.char_index(characters)
  end

  def test_hash_values_in_lookup
    a_z_lookup = Shift.a_z_lookup
    assert_equal ['y', 7], Shift.hash_values('h')
  end

  def test_hash_values_not_in_lookup
    a_z_lookup = Shift.a_z_lookup
    assert_equal ['n', '!'], Shift.hash_values('!')
  end

  def test_a_z_lookup
    a_z_lookup = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal a_z_lookup, Shift.a_z_lookup
  end

  def test_nested_2_levels
    assert_equal ({}), Shift.nested_2_levels
  end

end
