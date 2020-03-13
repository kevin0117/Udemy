# File.open('foo.txt')
# f = File.open'foo.txt'

# puts f  ## it will get file object ==> <File:0x00007fef9483d840>

#------------------------------------------
# if the file does not exist
# not_exist_file = File.open 'no.txt'

# puts not_exist_file 
# get error message => No such file or directory @ rb_sysopen - no.txt (Errno::ENOENT)

# -----------------------
 
# "r": read, "w": write, "a": append, it mean if there is a fule, then use it, otherwise, create one
# f = File.open("foo.txt", "r") # "r": read, "w": write, "a": append, it mean if there is a fule, then use it, otherwise, create one
# puts f.read 

# -------------------------
# File.open("foo.txt", "r").each do |line|
#   puts line
#   puts "--------"
# end
# ----------------------------
# f = File.open("foo.txt", "r")

# puts f.readline # this only read one line
# f.each do |line| 
#   puts line
# end

# we should always close the file if we open it, waste memory space 
# f.close

# # if you use block, then you don't need to f.close
# File.open('foo.txt','r') do |f|
#   puts f.read
# end

# if we use 'w', it will overwrite everything on the foo.txt
# File.open('foo.txt', 'w') do |f|
#   f.write 'new line of text'
# end
# if we use 'a', it will append new text at the end, instead of erasing everthing 
# File.open('foo.txt', 'a') do |f|
#     f.write "\nappend new line of text\n"
# end

# 5.times do |i|
#   File.open('foo.txt', 'a') do |f|
#     f.write "New line of text\n"
#   end
# end
f = File.open('foo.txt','a')
5.times do |i|
  puts " Please enter some text"
  input_text = gets.chomp 

  f.write"\n#{input_text}\n"
end
