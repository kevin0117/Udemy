students = [
             { name: "Bob", age: 18 },
             { name: "Alice", age: 20 }
           ]

def find_by_name(students_collection, name)
  result_hash = {}
  result = students_collection.select { |student| result_hash = student if student[:name] == name }
  puts (result_hash.empty?) ? "Student not found: #{name}" : "Student found: #{result_hash}"
end
  find_by_name(students, 'Bob')
  find_by_name(students, 'Carol')


# def find_by_name(students_collection, name)
#   number_of_students = students_collection.count
#   counter = 0
#   while counter < number_of_students do
#     if students_collection[counter][:name] == name
#       puts "Student found: #{students_collection[counter]}"
#       break
#     else
#       puts "Student not found: #{name}"
#       break
#     end 
#     counter += 1
#   end
# end

# def find_by_name(students_collection, name)
#   students_collection.each do |n|
#     if n[:name] == name
#       puts "Student found: #{n}"
#       break
#     else
#       puts "Student not found: #{name}"
#       break      
#     end
#   end
# end

# def find_by_name(students_collection, name)
#   result_hash = {}
#   result = students_collection.select { |student| result_hash = student if student[:name] == name }
#   puts (result_hash.empty?) ? "Student not found: #{name}" : "Student found: #{result_hash}"
#   # if result.empty?
#   #   puts "Student not found: #{name}"
#   # else
#   #   puts "Student found: #{result_hash}"
#   # end
# end