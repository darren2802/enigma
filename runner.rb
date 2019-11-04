require_relative './lib/enigma'

enigma = Enigma.new

enigma.encrypt('hello world!', '02715', '040895')

#enigma.decrypt("keder ohulw", "02715", "040895")
