# puts Dir.pwd

# Dir.chdir("/Volumes/MAC/RUBY/Udemy")

puts Dir.pwd

path = "/Volumes/MAC/RUBY/Udemy"

if Dir.exist?(path)
  Dir.chdir(path)   
end

puts "Files in #{Dir.pwd} are: "
Dir.entries(path).each {|i| puts "The filename is: " + i}