require_relative './test_helper'
require_relative '../lib/enigma'
require 'Date'

class TestEnigma < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_enigma_initialized
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_generate_key
    srand(1111)
    assert_equal '09554', @enigma.generate_key
  end

  def test_enigma_keys
    assert_equal [2, 27, 71, 15], @enigma.keys("02715")
  end

  def test_enigma_offsets
    assert_equal [1, 0, 2, 5], @enigma.offsets("040895")
  end

  def test_enigma_generate_date
    date_today = Date.today.strftime('%d%m%y')
    assert_equal date_today, @enigma.generate_date
  end

  def test_enigma_cipher_decipher_y
    value = {char: "k", encrypt?: "y", index: 7}
    a_z_lookup = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal 'h', @enigma.cipher_decipher(value, a_z_lookup)
  end

  def test_enigma_cipher_decipher_n
    value = {char: "!", encrypt?: "n", index: '!'}
    a_z_lookup = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal '!', @enigma.cipher_decipher(value, a_z_lookup)
  end

  def test_enigma_cipher
    characters = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    shifts = [3, 27, 73, 20]
    assert_equal "keder ohulw", @enigma.cipher(characters, shifts)
  end

  def test_enigma_decipher
    characters = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]
    shifts = [3, 27, 73, 20]
    assert_equal 'hello world', @enigma.decipher(characters, shifts)
  end

  def test_enigma_encrypt
    assert_equal "keder ohulw", @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_enigma_decrypt
    assert_equal "hello world", @enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
