# Question 1
# Examine the following code:

class Cat
  @@total_cats = 0

  def initialize(name)
    @name = name
  end

  def jump
    "#{name} is jumping!"
  end

  def self.total_cats
    @@total_cats
  end
end

mitzi = Cat.new('Mitzi')
mitzi.jump # => "Mitzi is jumping!"
Cat.total_cats # => 1
"The cat's name is #{mitzi}" # => "The cat's name is Mitzi"

# You must make some changes to the above code so that the last three statements
# return the values shown in the comments. Which of the following changes do you
# need to make? (You may need to make more than one change).

=begin
A
Add attr_reader :name to the class definition.

B
Change the method body of Cat#jump to "#{self.name} is jumping!"

C
Add a #to_s method that returns the value of the @name instance variable.

D
Add the line @@total_cats += 1 to the #initialize method.

Answers: A, C, D
=end

# **********************************************************************************************************

# Question 2
# Examine the following Ruby code:

class Student
  # class body
end

ade = Student.new('Adewale')
ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
# Which of the following code snippets can you add to the class body so that the above code
# returns a Student object whose state matches the comment in the last line shown above? Select all that apply.

# A
def initialize(name, grade=nil)
  @name = name
  @grade = grade
end

# B
def initialize(name)
  self.name = name
  @grade = nil
end

# C
def initialize(name)
  @name = name
  @grade = nil
end

# D
attr_accessor :grade

def initialize(name, grade=nil)
  @name = name
end

# Answers: A, C

# **********************************************************************************************************

# Question 3
# We now want to add some attr_* methods to our Student class so that we can access and update the state of a
# Student object. Examine the following Ruby code:

class Student
  # assume that this code includes an appropriate #initialize method
end

jon = Student.new('John', 22)
jon.name # => 'John'
jon.name = 'Jon'
jon.grade = 'B'
jon.grade # => 'B'
# Assuming that the Student class already has an appropriate #initialize method, which of the following code snippets
# could you add to the Student class to define the getters and setters you need to make the example code run as shown?
# Select all that apply.

# A
attr_reader :name
attr_accessor :grade

# B
attr_writer :name, :grade
attr_reader :name, :grade

# C
attr_accessor :name, :grade

# D
attr_accessor :name
attr_writer :grade

# Answers: B, C

# **********************************************************************************************************

# Question 4
# Examine the following code:

class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
sir_gallant.name # => "Sir Gallant"
sir_gallant.speak # => "Sir Gallant is speaking."
# You must make some changes to the above code so that the last two statements return the values shown
# in the comments. Which of the following changes do you need to make? (You may need to make more than one change).

# A
# Add def name; @name; end to the Character class.

# B
# Change the method body of the Character #speak method to "#{name} is speaking."

# C
# Change the attr_accessor to an attr_writer.

# D
# Change the Knight#name method to a class method.

# Answers: B
# **********************************************************************************************************

# Question 5
# Let's add a Thief class as a descendant of Character. Examine the following code:

class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Thief < Character; end

sneak = Thief.new("Sneak")
sneak.name # => "Sneak"
sneak.speak # => "Sneak is whispering..."
# You must make some changes to the above code so that the last two statements return the values shown in the comments.
# Which of the following changes do you need to make?

# A
# Add def self.speak; "#{name} is whispering..."; end to the Thief class.

# B
# Change the body of the Character#initialize method to @name = name + " is whispering..."

# C
# Add def initialize; @name = name + " is whispering..."; end to the Thief class.

# D
# Add def speak; "#{name} is whispering..."; end to the Thief class.

# Answers: D
# **********************************************************************************************************

# Question 6
# Examine the following class definition:

class FarmAnimal
  def speak
    "#{self} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    "baaaaaaa!"
  end
end

class Cow
  def speak
    super + "mooooooo!"
  end
end

Sheep.new.speak # => "Sheep says baa!"
Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
Cow.new.speak # => "Cow says mooooooo!"
# You must make some changes to the above code so that the last three statements return the values shown in the comments.
# Which of the following changes do you need to make? (You may need to make more than one change).

# A
# Make Cow inherit from FarmAnimal.

# B
# Change all the #speak instance methods to ::speak class methods.

# C
# Change the method body of Lamb#speak to super + "baaaaaaa!"

# D
# Change the method body of FarmAnimal#speak to "#{self.class} says "

# Answers: A, C, D
# **********************************************************************************************************

# Question 7

# What, specifically, do we mean when we refer to collaborator objects in OO Ruby?

# A
# An object that has the same class as another object.

# B
# An object that is assigned to an instance variable in another object.

# C
# An object that shares behaviors with another object, i.e. by both mixing in the same module.

# D
# An object that is part of the same class inheritance chain as another object.

# Answers: B
# **********************************************************************************************************

# Question 8
# Examine the code below.

class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)
# Identify all custom defined objects that act as collaborator objects within the code. Select all that apply.

# A
# The Person object referenced by the variable sara.

# B
# "Sara"

# C
# The Cat object referenced by the variable fluffy.

# D
# "Fluffy"

# Answers: A, B, D # answer is A specified a custom defined object
# **********************************************************************************************************

# Question 9
# Which of the following are differences between modules and classes? Select all that apply.

# Your Answer
# A
# Classes let you instantiate objects whereas modules don't.

# B
# Modules can be used for namespacing whereas classes can not.

# C
# You can sub-class from precisely one parent class, but you can mix in as many modules as you need.

# D
# Classes may contain more than one method, but modules must have precisely one method.

# Answers: A, B, C
# **********************************************************************************************************

# Question 10
# Examine the class hierarchy below.  Refer to the restaurant-hierarchy.png file
# One reason to use modules in Ruby is to share common behavior between classes when you can't share them via
# class inheritance. Given this context, which of the following methods would it be appropriate to extract to a module? Select all that apply.

# A
# cook

# B
# supervise

# C
# speak_to_customer

# D
# take_food_order

# Answers: B # answer is B, C not really sure I agree with this

=begin
You're designing a Recipe Book application. You've identified some classes that you need:

RecipeBook
Recipe
StarterRecipe
MainCourseRecipe
DessertRecipe
Ingredient

Each Recipe Book has one or more recipes. Starter recipes, main course recipes, and dessert recipes
are all recipe types and share some characteristics but not others. Recipes have one or more ingredients.

You decide that the application also needs a Conversion module that contains some temperature and
measurement conversion methods required by Recipe and Ingredient objects.
=end

# Question 11
# What kind of Object Oriented relationship should exist between objects of the RecipeBook and MainCourseRecipe classes?

# A
# Inheritance

# B
# Mixin

# C
# Collaboration

# D
# None

# Answers: A # answer is C because we will have many recipies in a RecipeBook
# **********************************************************************************************************

# Question 12
# What kind of Object Oriented relationship should exist between the Ingredient class and Conversion module?

# A
# Inheritance

# B
# Mixin

# C
# Collaboration

# D
# None

# Answers: B
# **********************************************************************************************************

# Question 13
# What kind of Object Oriented relationship should exist between objects of the Recipe and DessertRecipe classes?

# A
# Inheritance

# B
# Mixin

# C
# Collaboration

# D
# None

# Answers: A
# **********************************************************************************************************

# Quesiton 14
# What kind of Object Oriented relationship should exist between objects of RecipeBook and Ingredient classes?

# A
# Inheritance

# B
# Mixin

# C
# Collaboration

# D
# None

# Answers: D # answer was C I guess this is correct because a RecipeBook has Recipies and a Recipie has Ingredients
