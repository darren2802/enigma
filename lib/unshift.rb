class Unshift

  def self.unshift_chars(characters, shifts)
    char_indexed = Shift.char_index(characters)
    chars_unshifted = char_indexed.each_value do |value|
      if value[:encrypt?] == 'y'
        value[:index] -= shifts[0]
        shifts.rotate!
      end
    end
  end

end
