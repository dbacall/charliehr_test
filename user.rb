require 'date'

class User

  attr_reader :name, :date_of_birth

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  # Returns an Integer representing the user’s current age
  def age
    age = Date.today.year - @date_of_birth.year
    b = Date.new(Date.today.year, @date_of_birth.month, @date_of_birth.day)
    age -= 1 if b > Date.today
    return age
  end

  # Returns a Date object for the user's current upcoming birthday
  def next_birthday
    year_of_birthday = Date.today.year
    year_of_birthday += 1 if Date.new(year_of_birthday, @date_of_birth.month, @date_of_birth.day) < Date.today
    return Date.new(year_of_birthday, @date_of_birth.month, @date_of_birth.day)
  end

end

tests = [
  Date.new(1986, 1, 1),
  Date.new(1988, Date.today.month, Date.today.day),
  Date.new(1990, 12, 30),
]

puts "====== ages ======"
tests.each do |date|
  puts "#{date} => #{User.new("Test", date).age}"
end

puts "====== birthdays ======"
tests.each do |date|
  puts "#{date} => #{User.new("Test", date).next_birthday}"
end