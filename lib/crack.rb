require_relative './enigma'

if ARGV.count != 3
  puts 'Usage: ruby crack.rb encrypted.txt cracked.txt date'
  puts 'Please try again'
  exit
end

file_cipher_text = ARGV[0]
file_cracked_text = ARGV[1]
date = ARGV[2]

cipher_file = File.open(file_cipher_text, 'r')
cipher_text = cipher_file.read.chomp
cipher_file.close

enigma = Enigma.new
return_val = enigma.crack(cipher_text, date)
cracked = return_val[:decryption]
key = return_val[:key]

message_file = File.open(file_cracked_text, 'w')
message_file.write(cracked)
message_file.close

puts "Created '#{file_cracked_text}' with the cracked key #{key} and date #{date}"

# ruby ./lib/crack.rb ./lib/encrypted.txt ./lib/cracked.txt 061119

# Created './lib/cracked.txt' with the cracked key 17844 and date 061119
