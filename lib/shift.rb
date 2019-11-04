class Shift
  def self.shifts(keys, offsets)
    zipped = keys.zip(offsets)
    zipped.map { |zip| zip.sum }
  end

  def self.shift_chars(characters, shifts)
    char_indexed = char_index(characters)
    chars_shifted = char_indexed.each_value do |value|
      if value[:encrypt?] == 'y'
        value[:index] += shifts[0]
        shifts.rotate!
      end
    end
  end

  def self.char_index(characters)
    counter = 0
    indexed = characters.reduce(self.nested_2_levels) do |acc, char|
      values = hash_values(char)
      acc[counter][:char] = char
      acc[counter][:encrypt?] = values[0]
      acc[counter][:index] = values[1]
      counter += 1
      acc
    end
  end

  def self.hash_values(char)
    a_z_lookup = self.a_z_lookup
    index = a_z_lookup.find_index(char)
    if index
      ['y', index]
    else
      ['n', char]
    end
  end

  def self.a_z_lookup
    ('a'..'z').to_a << ' '
  end

  def self.nested_2_levels
    Hash.new{ |hash, key| hash[key] = Hash.new }
  end
end
