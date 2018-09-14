# require 'minitest/autorun'
# require 'minitest/pride'
# require 'pry-byebug'

class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS
  end
end

puts Cat.new.legs
