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

module Mammal
  class Dog
    def speak(sound)
      "says #{sound}"
    end
  end

  class Cat
    def say_name(name)
      "come here #{name}"
    end
  end
end

puts Mammal::Dog.new.speak("Arf")
puts Mammal::Cat.new.say_name("Tabby")
