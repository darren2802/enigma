require_relative './test_helper'
require_relative '../lib/enigma'

class TestEnigma < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_enigma_initialized
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_encrypt
    encrypted = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal encrypted, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_enigma_decrypt
    unencrypted = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal unencrypted, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

end
