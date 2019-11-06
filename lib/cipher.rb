class Cipher

  def self.cipher(characters, shifts)
    shifted_chars = Shift.shift_chars(characters, shifts)
    a_z_lookup = ('a'..'z').to_a << ' '
    ciphered = ''
    shifted_chars.each_value do |value|
      ciphered += self.cipher_decipher(value, a_z_lookup)
    end
    ciphered
  end

  def self.decipher(characters, shifts)
    unshifted_chars = Unshift.unshift_chars(characters, shifts)
    a_z_lookup = ('a'..'z').to_a << ' '
    deciphered = ''
    unshifted_chars.each_value do |value|
      deciphered += self.cipher_decipher(value, a_z_lookup)
    end
    deciphered
  end

  def self.cipher_decipher(value, a_z_lookup)
    if value[:encrypt?] == 'y'
      a_z_lookup.at(value[:index] % 27)
    else
      value[:index]
    end
  end

end
