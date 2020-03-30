require 'csv'

def display_option_menu
  puts ''
  puts 'Your menu options are:'
  puts ''
  puts 'Enter 1 to create new registration: '
  puts 'Enter 2 to read existing registration: '
  puts 'Enter 3 to update existing registration: '
  puts 'Enter 4 to delete existing registration: '
  puts 'Enter 5 to search existing registration: '
  puts 'Enter 6 to dispaly all existing registrations: '
  puts 'Enter exit to exit the system: '
  puts ''
  print 'Please enter your selection: '
end

def display_create_option
  puts ''
  puts 'You have chosen to create a new registration'
  puts ''
  print 'Please enter a first name: '
    name_input = gets.chomp
    first_name = validator('First name', name_input)
  print 'Please enter a last name: '
    name_input = gets.chomp
    last_name = validator('Last name', name_input)
  print 'Please enter an age: '
    age_input = gets.chomp
    age = validator('Age', age_input)
    student = Student.new(first_name, last_name, age)
    student.create
end

def display_read_option
  puts ''
  puts 'You have chosen to read a registration'
  puts ''
  print 'Please enter a student ID: '
  id_input = gets.chomp
  student_id = validator('Student ID', id_input)
  Student.show(student_id)
end

def display_update_option
  puts ''
  puts 'You have chosen to update a registration'
  puts ''
  print 'Please enter a student ID: '
    id_input = gets.chomp
    student_id = validator('Student ID', id_input)
  print 'Please enter a first name: '
    name_input = gets.chomp
    first_name = validator('First name', name_input)
  print 'Please enter a last name: '
    name_input = gets.chomp
    last_name = validator('Last name', name_input)
  print 'Please enter an age: '
    age_input = gets.chomp
    age = validator('Age', age_input)
    student = Student.read(student_id)
    student.first_name = first_name
    student.last_name = last_name
    student.age = age
    student.update  
end

def display_delete_option
  puts ''
  puts 'You have chosen to delete a registration'
  puts ''
  print 'Please enter a student ID: '
  id_input = gets.chomp
  student_id = validator('Student ID', id_input)
  print "Please enter (Y or y) to confirm deleting Student-#{student_id} file: "
  confirm_input = gets.chomp
  confirm = validator('Input', confirm_input).downcase
  if confirm == 'y'
    Student.destroy(student_id)
  end
end

def display_search_option
  puts ''
  puts 'You have chosen to search student record file'
  puts ''
  print 'Please enter Student First Name to locate the associated file: '
  search_input = gets.chomp
  file_name = validator('First Name', search_input)
  search_file(file_name)
end

def search_file(input_name)
  matching_files = Dir["Student-*-file.csv"]
  counter = 0
  puts ''
  puts "Filename                   First Name        Last Name              Age"
  matching_files.each do |file|
    File.open(file, 'r') do |f|
      first_name = CSV.parse(f.read).first[0]
      if input_name == first_name
        display_CSV_data(file)
      else
        counter += 1
      end
    end
  end
  if counter == matching_files.length
    puts ''
    puts "Can't locate the file with Student First Name: #{input_name} in the system"
  end
end

def display_file_index
  matching_files = Dir["Student-*-file.csv"]
  puts "Filename                   First Name        Last Name              Age"
  matching_files.each do |file|
      display_CSV_data(file)
    end
end

def display_CSV_data(file)
  CSV.open(file,'r') do |csv|
    data_line = csv.read.first
    first_name = data_line[0]
    last_name = data_line[1]
    age = data_line [2]
    if first_name.length < 12
      space_count = 12 - first_name.length
      first_name = first_name + " " * space_count
    end
    if last_name.length < 12
      space_count = 12 - last_name.length
      last_name = last_name + " " * space_count
    end
    print "#{file}"
    print "      #{first_name}"
    print "      #{last_name}"
    print "           #{age}"
    puts ""
  end
end

def validator(field_name, input)
  while input.length == 0 do
    puts "#{field_name} can't be blank, please enter again"
    input = gets.chomp
  end
  return input
end