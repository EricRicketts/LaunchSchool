# require 'minitest/autorun'
# require 'minitest/pride'
# require 'pry-byebug'

arr = %w[xray albatross dog horse deer shark elephant]

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def public_disclosure
    "#{self.name} is human years is #{human_years} old."
  end

  def a_public_method
    "Will this work?  " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes!!  I am proteted!!"
  end

  private

  def human_years
    DOG_YEARS * age
  end
end

dog = GoodDog.new("Sounder", 5)

puts dog.public_disclosure
puts dog.a_public_method
