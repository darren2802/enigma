require_relative './enigma'

if ARGV.count != 4
  puts 'Usage: ruby decrypt.rb encrypted.txt decrypted.txt key date'
  puts 'Please try again'
  exit
end

file_cipher_text = ARGV[0]
file_message_text = ARGV[1]
key = ARGV[2]
date = ARGV[3]

cipher_file = File.open(file_cipher_text, 'r')
cipher_text = cipher_file.read.chomp
cipher_file.close

enigma = Enigma.new
deciphered = enigma.decrypt(cipher_text, key, date)

message_file = File.open(file_message_text, 'w')
message_file.write(deciphered)
message_file.close

puts "Created '#{file_message_text}' with the key #{key} and date #{date}"

# ruby ./lib/decrypt.rb ./lib/encrypted.txt ./lib/decrypted.txt 67825 041119
