require 'csv'

class Person
  attr_accessor :first_name, :last_name, :person_id
  def initialize (first_name, last_name, person_id = rand(1000..9999))
    @first_name = first_name
    @last_name = last_name
    @person_id = person_id
  end

  def valid?
    (!first_name.nil? && first_name.length > 0) && (!last_name.nil? && last_name.length > 0)
  end

  def save
    filename = "#{person_id}-file.csv"
    # If we got back the successful object from here, that means the file is save successfully 
    save_file = CSV.open(filename, "w") do |csv|
      csv << [first_name, last_name]
    end
    puts "File #{filename} saved for the employee with ID #{person_id}"
    return !save_file.nil?
  end

  def self.read(person_id)
    filename = "#{person_id}-file.csv"
    if File.exist?(filename)
      File.open(filename,'r') do |f|
        employee_name = CSV.parse(f.read).flatten
        first_name = employee_name[0]
        last_name = employee_name[1]

        return Person.new(first_name, last_name, person_id)
      end
    else
      puts "The #{filename} doesn't exist" 
    end
  end

  def update
    filename = "#{person_id}-file.csv"
    if File.exist?(filename)
      update_file = CSV.open(filename, "w") do |csv|
        csv << [first_name, last_name]
      end
      puts "File #{filename} updated for the employee with ID #{person_id}"
      return !update_file.nil?
    else
      puts "The #{filename} file doesn't exist, update cannot be performed" 
      return false
    end
  end


#   def show
#     filename = "#{person_id}-file.csv"
#     if File.exist?(filename)
#       File.open(filename,'r') do |f|
#         puts f.read
#       end
#     else
#       puts "The #{filename} doesn't exist" 
#     end
#     # My version of show
#     # CSV.open("#{person_id}-file.csv",'r') do |csv|
#     #   csv.readline
#     # end
#   end


end
