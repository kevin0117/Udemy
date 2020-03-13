credential_list = []
not_exit = true

def validator(field_name, input)
  while input.length == 0 do
    puts "#{field_name} can't be blank, please enter again"
    input = gets.chomp
  end
  return input
end

while not_exit do
  puts "Please enter a site name (enter exit to exit): "
  site_input = gets.chomp

  if site_input == 'exit'
    not_exit = false 
  else
    site = validator('Site', site_input)

    puts "Please enter a username: "
    name_input = gets.chomp
    username = validator('Username', name_input)

    puts "Please enter a password: "
    password_input = gets.chomp
    password = validator('Password', password_input)

    credential_list.push({site: site, username: username, password: password})
  end
end
puts "Thank you !"
puts "Existing...Your list of credentials is: "
print credential_list