contact_directory = []

loop do
  
  print "Please enter a contact name or exit to exit:"
  user_input = gets.chomp.to_s
  if user_input == 'exit'
     print "You chose to exit the program"
     break
  else 
     print "Please enter a contact phone"
     phone_input = gets.chomp.to_s
     contact_directory.push({name: user_input, phone: phone_input})
  end
end
contact_directory.each do |element|
   if element[:name] == 'kevin'
      p "You found me"
   end
end


