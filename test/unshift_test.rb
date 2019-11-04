require_relative './test_helper'
require_relative '../lib/unshift'
require_relative '../lib/shift'

class TestUnshift < Minitest::Test
  def test_unshift_unshift_chars
    characters = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]
    shifts = [20, 3, 27, 73]
    chars_unshifted = {
      0=>{char: "k", encrypt?: "y", index: -10},
      1=>{char: "e", encrypt?: "y", index: 1},
      2=>{char: "d", encrypt?: "y", index: -24},
      3=>{char: "e", encrypt?: "y", index: -69},
      4=>{char: "r", encrypt?: "y", index: -3},
      5=>{char: " ", encrypt?: "y", index: 23},
      6=>{char: "o", encrypt?: "y", index: -13},
      7=>{char: "h", encrypt?: "y", index: -66},
      8=>{char: "u", encrypt?: "y", index: 0},
      9=>{char: "l", encrypt?: "y", index: 8},
      10=>{char: "w", encrypt?: "y", index: -5}}
    assert_equal chars_unshifted, Unshift.unshift_chars(characters, shifts)
  end
end
