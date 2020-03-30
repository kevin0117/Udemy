require_relative 'student'
require_relative 'helper'

in_the_system = true
puts ''
puts 'Welcome to the student registration system!'
puts '==========================================='

while in_the_system
  display_option_menu
  response = gets.chomp
  if response == 'exit'
    puts 'Thank you for using the student registration system!'
    in_the_system = false
  else
    case response
    when '1'
      display_create_option
    when '2'
      display_read_option
    when '3'
      display_update_option
    when '4'
      display_delete_option
    when '5'
      display_search_option
    when '6'
      display_file_index
    else
      puts ''
      puts 'That is not a valid option. Please try again'
    end
  end
end