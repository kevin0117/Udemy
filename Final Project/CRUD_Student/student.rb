# frozen_string_literal: true

require 'csv'

class Student
  attr_accessor :first_name, :last_name, :age, :filename
  attr_reader :student_id

  def initialize(first_name, last_name, age = 0, student_id = rand(1000..9999))
    @first_name = first_name
    @last_name = last_name
    @age = age
    @student_id = student_id
    @filename = "Student-#{student_id}-file.csv"
  end

  def save
    save_file = CSV.open(filename, 'w') do |csv|
      csv << [first_name, last_name, age]
    end
    puts ''
    puts "Student Name: #{first_name} #{last_name}"
    puts "Student Age: #{age}"
    puts ''
    puts "The student record with ID #{student_id} was written to the file #{filename}"
    puts ''
    !save_file.nil?
  end

  def create
    if !File.exist?(filename)
      save
      puts "#{filename} file now exists in the system"
    else
      puts ''
      puts "#{filename} file is already created in the system"
    end
  end

  def self.read(student_id)
    filename = "Student-#{student_id}-file.csv"
    CSV.open(filename, 'r') do |csv|
      data_line = csv.read
      return Student.new(data_line[0], data_line[1], data_line[2], student_id)
    end
  end

  def self.show(student_id)
    filename = "Student-#{student_id}-file.csv"
    if File.exist?(filename)
      CSV.open(filename, 'r') do |csv|
        data_line = csv.read
        puts ''
        puts "Student Name: #{data_line[0][0]} #{data_line[0][1]}"
        puts "Student Age: #{data_line[0][2]}"
      end
    else
      puts ''
      puts "#{filename} file is not in the system" 
    end
  end

  def update
    if File.exist?(filename)
      save
      puts "#{filename} file is successfully updated"
    else
      puts "Student-#{student_id} file cannot be updated"
    end
  end

  def self.destroy(student_id)
    filename = "Student-#{student_id}-file.csv"
    if File.exist?(filename)
      File.delete(filename)
      puts ''
      puts "#{filename} file is successfully destroyed"
    else
      puts ''
      puts "#{filename} file is not in the system"
    end
  end
end
