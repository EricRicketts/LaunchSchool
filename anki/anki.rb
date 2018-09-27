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




class Cube
  def initialize(volume)
    @volume = volume
  end
end

cube = Cube.new(100)
puts cube.instance_variable_get("@volume")