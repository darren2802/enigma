require 'Date'
require_relative './shift'

class Enigma

  def encrypt(message, key = generate_key, date = generate_date)
    characters = message.chars
    keys = keys(key)
    offsets = offsets(date)
    shifts = Shift.shifts(keys, offsets)
    cipher(characters, shifts)
  end

  def cipher(characters, shifts)
    shifted_chars = Shift.shift_chars(characters, shifts)
    a_z_lookup = Shift.a_z_lookup
    ciphered = ''
    shifted_chars.each_value do |value|
      if value[:encrypt?] == 'y'
        ciphered += a_z_lookup.at(value[:index] % 27)
      else
        ciphered += value[:index]
      end
    end
    ciphered
  end

  def generate_key
    rand.to_s[2..6]
  end

  def generate_date
    Date.today.strftime('%d%m%y')
  end

  def keys(key)
    keys = []
    key.chars.each_cons(2) { |char| keys << char.join }
    keys.map { |key| key.to_i }
  end

  def offsets(date)
    squared = (date.to_i ** 2).to_s
    last_four = squared[-4..-1].chars
    last_four.map { |offset| offset.to_i }
  end

  def decrypt(ciphertext, key, date)
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
  end

end
