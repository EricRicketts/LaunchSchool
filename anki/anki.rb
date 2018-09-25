# require 'minitest/autorun'
# require 'minitest/pride'
# require 'pry-byebug'

arr = %w[xray albatross dog horse deer shark elephant]

# class Animal
#   attr_reader :type, :color

#   def initialize(type, color)
#     @type = type
#     @color = color
#   end
# end

# class Dog < Animal
#   attr_reader :breed

#   def initialize(type, color, breed)
#     super
#     @breed = breed
#   end
# end

# dog = Dog.new("Mammal", "Brown", "Blood Hound")
# p dog

module MyModule
  def self.my_method(num)
    num * num
  end

  def self.another_method(str)
    str
  end
end

puts MyModule.my_method(4)
puts MyModule::another_method("foo bar")
