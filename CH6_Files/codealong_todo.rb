# Instructor Version
not_exit = true

while not_exit do
  print "Please enter your todo or exit: "
  input = gets.chomp

  if input == 'exit'
    puts "Thank you for using this app"
    not_exit = false
  else
    todo = "TODO: #{input}\n"

    File.open('todo.txt', 'a') do |file|
      file.write(todo)
    end
  end
end


# ----------------------- MY Version----------------------
# exit_app = false

# def input_recorder(input)
#   File.open('todo.txt','a') do |f|
#     f.write "TODO: #{input}\n"
#   end
# end

# while exit_app == false do
#   puts "Please enter your todo or exit: "
#   input = gets.chomp
#   (input == 'exit') ? exit_app = true : input_recorder(input)
# end
# puts "Thank you for using this app"

