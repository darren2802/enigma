require 'Date'
require_relative './shift'
require_relative './unshift'

class Enigma

  def encrypt(message, key = generate_key, date = generate_date)
    characters = message.downcase.chars
    keys = keys(key)
    offsets = offsets(date)
    shifts = Shift.shifts(keys, offsets)
    text = cipher(characters, shifts)
    return_val(:encryption, text, key, date)
  end

  def decrypt(ciphertext, key, date = generate_date)
    characters = ciphertext.downcase.chars
    keys = keys(key)
    offsets = offsets(date)
    shifts = Shift.shifts(keys, offsets)
    text = decipher(characters, shifts)
    return_val(:decryption, text, key, date)
  end

  def crack(ciphertext, date = generate_date)
    counter = 0
    potential_key = ''
    text = ''
    loop do
      counter += 1
      potential_key = generate_key_crack(counter)
      text = decrypt(ciphertext, potential_key, date)[:decryption]
      break if text[-4..-1] == ' end'
    end
    return_val(:decryption, text, potential_key, date)
  end

  def return_val(type, text, key, date)
    return_hash = Hash.new()
    return_hash[type] = text
    return_hash[:key] = key
    return_hash[:date] = date
    return_hash
  end

  def cipher(characters, shifts)
    shifted_chars = Shift.shift_chars(characters, shifts)
    a_z_lookup = ('a'..'z').to_a << ' '
    ciphered = ''
    shifted_chars.each_value do |value|
      ciphered += cipher_decipher(value, a_z_lookup)
    end
    ciphered
  end

  def decipher(characters, shifts)
    unshifted_chars = Unshift.unshift_chars(characters, shifts)
    a_z_lookup = ('a'..'z').to_a << ' '
    deciphered = ''
    unshifted_chars.each_value do |value|
      deciphered += cipher_decipher(value, a_z_lookup)
    end
    deciphered
  end

  def cipher_decipher(value, a_z_lookup)
    if value[:encrypt?] == 'y'
      a_z_lookup.at(value[:index] % 27)
    else
      value[:index]
    end
  end

  def generate_key
    rand.to_s[2..6]
  end

  def generate_key_crack(counter)
    '%05d' % counter
  end

  def keys(key)
    keys = []
    key.chars.each_cons(2) { |char| keys << char.join }
    keys.map { |this_key| this_key.to_i }
  end

  def generate_date
    Date.today.strftime('%d%m%y')
  end

  def offsets(date)
    squared = (date.to_i ** 2).to_s
    last_four = squared[-4..-1].chars
    last_four.map { |offset| offset.to_i }
  end

end
