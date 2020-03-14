require 'csv'
valid_array = []
def input_validator(input)
  while input.length == 0
    puts "Please enter valid input (input can't be empty):"
    input = gets.chomp.downcase
  end
  input
end

exit_app = false
while exit_app == false
  puts "Please enter the student's name (enter exit to exit): "
  input = gets.chomp
  if input == 'exit'
    exit_app = true
  else
    valid_name_input = input_validator(input)
    puts "Please enter the student's age: "
    age_input = gets.chomp
    valid_age_input = input_validator(age_input)
    student_info = [valid_name_input, valid_age_input]

    CSV.open('student.csv','a') do |csv|
      csv << student_info
    end
  end
end

puts "Thank you! Ther record has been added to our file"