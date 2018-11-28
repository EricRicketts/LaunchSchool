# Question 1
# Examine the code below:

num = 8

if #omitted code
  puts 'Goodbye'
end
# Which of the following code snippets can replace #omitted code so the code outputs Goodbye? Select all that apply.

# A
num > 5 && num < 10

# B
num < 4 || num == 8 && num > 6

# C
num < 7 || num > 7

# D
num >= 8 && num < 6 || num > 4

# Answers: A, B, C, D
# ********************************************************************************************************************

# Question 2
# Examine the code below:

num = 12

if #omitted code
  puts 'Hello'
end
# Which of the following code snippets can replace #omitted code so the code outputs Hello? Select all that apply.

# A
num / 3 > 3 && num < 10

# B
num < 4 || num > 8 && num < 10 || num > 16

# C
num % 4 == 0 || num < 7 && num < 10

# D
num >= 8 && num < 6 || num > 4 && num < 16

# Answers: B, C, D # forgot that num = 12 so num is not > 16, answer is C, D
# ********************************************************************************************************************

# Question 3
# Which of the following are methods, not real operators? Select all that apply.

# A
# *

# B
# <=

# C
# %

# D
# &&

# Answers: A, B, C
# ********************************************************************************************************************

# Question 4
# Again, which of the following are methods, not real operators? Select all that apply.

# A
# ==

# B
# []=

# C
# ||

# D
# >

# Answers: A, B, D
# ********************************************************************************************************************

# Question 5
# Examine the Ruby code below:

str1 = "I'm a string"
str2 = str1
# Which of the following conditional expressions can you use to determine whether str1 and str2 point to the same object?
# Select all that apply.

# A
str1 == str2

# B
str1.equal?(str2)

# C
str1.eql?(str2)

# D
str1.object_id == str2.object_id

# Answers: B, D
# ********************************************************************************************************************

# Question 6
# Examine the Ruby code below:

str1 = "I am a string"
str2 = "I am a string"
p str1
"I am a string"
p str2
"I am a string"

# Which of the following expressions are guaranteed to return true given the results shown above? Assume str1 and str2 are objects
# of the String class. Select all that apply.

# A
str1 == str2

# B
str1.equal?(str2)

# C
str1 === str2

# D
(str1 <=> str2) == 0

# Answers: A, C, D
# ********************************************************************************************************************

# Question 7
# Examine the Ruby code below:

class Thing
  attr_accessor :size

  def initialize(s)
    @size = s
  end

  def ==(other_thing)
    size == other_thing.size
  end
end

thing1 = Thing.new(5)
thing2 = Thing.new(5)
thing3 = thing1
thing1.size = 4
# Which of these code snippets will return true? Select all that apply.

# A
thing1 == thing2

# B
thing2 == thing3

# C
thing3.equal? thing2

# D
thing3.equal? thing1

# Answers: B, D wrong answer is D
# ********************************************************************************************************************

# Question 8
# Examine the code below:

class Circle
  attr_reader :radius

  def initialize(r)
    @radius = r
  end

  def >(other)
    radius > other.radius
  end

  def ==(other)
    radius == other.radius
  end
end

circle1 = Circle.new(5)
circle2 = Circle.new(3)
circle3 = Circle.new(5)
# Which of these code snippets will return true? Select all that apply.

# A
circle1 > circle2

# B
circle2 < circle3

# C
circle1 == circle3

# D
circle3 != circle2

# Answers: A, C, D
# ********************************************************************************************************************

# Question 9
# Examine the code below:

number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end
# Which of the following methods does this case statement use to determine which when clause is executed? Select all that apply.

# A
# By using BasicObject#equal?.

# B
# By using Range#===.

# C
# By using Integer#===.

# D
# By using Integer#==.

# Answers: B, C
# ********************************************************************************************************************
# Question 10
# Examine the following code:

class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end
# Which variables in the Person class are scoped at the object level? Select all that apply.

# A
# TITLES

# B
# @@total_people

# C
# @name

# D
# @age

# Answers: C, D
# ********************************************************************************************************************

# Question 11
# Examine the following code:

module Speedy
  def run_fast
    @speed = 70
  end
end

class Animal
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Dog < Animal
  DOG_YEARS = 7

  def initialize(name, age)
    @dog_age = age * DOG_YEARS
  end
end

class Greyhound < Dog
  include Speedy
end

grey = Greyhound.new('Grey', 3)
# Which of the following instance variables are initialized when we instantiate the Greyhound object? Select all that apply.

# A
# @speed

# B
# @name

# C
# @age

# D
# @dog_age

# Answers: D
# ********************************************************************************************************************

# Question 12
# Examine the code below:

class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end
# Which of the following statements are true? Select all that apply.

# NOTE: If you're familiar with concurrent or multithreaded programming, assume that this code is not run concurrently
# and is single-threaded.

# A
# triangle.sides can sometimes return a value of 4.

# B
# triangle.sides always returns a value of 3.

# C
# triangle.new.sides can sometimes return a value of 4.

# D
# Triangle.new.sides always returns a value of 3.

# Answers: A, D
# ********************************************************************************************************************

# Question 13
# Examine the code below:

module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

Square.sides # => 4
Square.new.sides # => 4
Square.new.describe_shape # => "I am a Square and have 4 sides."
# You must make some changes to the above code so that the last three statements return the values shown in the comments.
# Which of the following changes do you need to make? (You may need to make more than one change).

# A
# Add SIDES = nil to the Describable module.

# B
# Add def sides; SIDES; end to the Quadrilateral class.

# C
# Change the method body of #describe_shape method to "I am a #{self.class} and have #{self.class::SIDES} sides."

# D
# Change the method body of Shape::sides method to self::SIDES.

# Answers: B, C, D
