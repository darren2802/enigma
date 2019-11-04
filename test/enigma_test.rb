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

  def test_enigma_generate_date
    date_today = Date.today.strftime('%d%m%y')
    assert_equal date_today, @enigma.generate_date
  end

  def test_enigma_cipher
    characters = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    shifts = [3, 27, 73, 20]
    assert_equal "keder ohulw", @enigma.cipher(characters, shifts)
  end

  def test_enigma_encrypt
    assert_equal "keder ohulw", @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_enigma_decrypt
    skip
    unencrypted = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal unencrypted, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

end
