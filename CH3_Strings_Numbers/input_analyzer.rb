def validate(input)
    if input == 0
      puts "You either enter 0 or some non-numeric input"
    elsif
      input > 10
      puts "Thank you! That is a number greater than 10"
    else
      puts "That is not a number greater than 10"
    end
end

puts "Please enter a number greater than 10"

user_input = gets.chomp.to_i

validate(user_input)

