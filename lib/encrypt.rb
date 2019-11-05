require_relative './enigma'

if ARGV.count != 2
  puts 'Usage: ruby encrypt.rb message.txt encrypted.txt'
  puts 'Please try again'
  exit
end

file_message_text = ARGV[0]
file_cipher_text = ARGV[1]

message_file = File.open(file_message_text, 'r')
message_text = message_file.read.chomp
message_file.close

enigma = Enigma.new
key = enigma.generate_key
date = enigma.generate_date
ciphered = enigma.encrypt(message_text)

cipher_file = File.open(file_cipher_text, 'w')
cipher_file.write(ciphered)
cipher_file.close

puts "Created '#{file_cipher_text}' with the key #{key} and date #{date}"
