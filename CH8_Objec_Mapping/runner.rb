require_relative 'person'

# person2 = Person.new('Jean','Chiu')

# person2.save



# p Person.update(2490, "Kevin", "Wang")
# person1 = Person.new("Jean", "Chiu", 2490)
# person1.save
# person1.first_name = "Kevin"
# person1.last_name = "Wang"

# person1 = Person.read(2490)
# # person1.first_name = "Kevin"
# person1.last_name = "Chiu"
# person1.update

# person = Person.new("List", "Jones")

# p person.create

person = Person.read(2265)

p Person.destroy(2265)

# person.last_name = "Annie"

# p person.update



