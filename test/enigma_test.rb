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

  def test_enigma_encrypt
    return_val = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal return_val, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_enigma_decrypt
    return_val =
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal return_val, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_enigma_generate_key_crack
    assert_equal '49621', @enigma.generate_key_crack(49621)
  end

  def test_enigma_crack
    return_val =
    {
      decryption: "hello world! end",
      key: "19603",
      date: "061119"
    }
    assert_equal return_val, @enigma.crack("buxpiphslap!dzcp")
  end
end
