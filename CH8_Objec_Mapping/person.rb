require 'csv'

class Person
  attr_accessor :first_name, :last_name, :person_id

  def valid?
    (!first_name.nil? && first_name.length > 0) && (!last_name.nil? && last_name.length > 0)
  end

  def save
    # If we got back the successful object from here, that means the file is save successfully 
    save_file = CSV.open("#{person_id}-file.csv", "w") do |csv|
      csv << [first_name, last_name]
    end
    return !save_file.nil?
  end
end

person1 = Person.new
person1.first_name = 'Bob'
person1.last_name = 'Lee'
person1.person_id = '1001'

p person1.save
