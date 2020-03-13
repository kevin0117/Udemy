require './utils.rb'
require_relative 'utils'

say_hello "This is my message"

# puts temperture ## if we try to print tempture, it will result in NameError
# ## undefined local variable or method `temperture' for main:Object (NameError)

puts __FILE__ #it prints the file we are currently working on
