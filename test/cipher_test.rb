require_relative './test_helper'
require_relative '../lib/cipher'
require_relative '../lib/shift'
require_relative '../lib/unshift'

class TestCipher < Minitest::Test
  def test_enigma_cipher_decipher_y
    value = {char: "k", encrypt?: "y", index: 7}
    a_z_lookup = ('a'..'z').to_a << ' '
    assert_equal 'h', Cipher.cipher_decipher(value, a_z_lookup)
  end

  def test_enigma_cipher_decipher_n
    value = {char: "!", encrypt?: "n", index: '!'}
    a_z_lookup = ('a'..'z').to_a << ' '
    assert_equal '!', Cipher.cipher_decipher(value, a_z_lookup)
  end

  def test_enigma_cipher
    characters = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    shifts = [3, 27, 73, 20]
    assert_equal "keder ohulw", Cipher.cipher(characters, shifts)
  end

  def test_enigma_decipher
    characters = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]
    shifts = [3, 27, 73, 20]
    assert_equal 'hello world', Cipher.decipher(characters, shifts)
  end
end
