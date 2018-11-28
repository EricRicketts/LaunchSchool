=begin
1.
Object Oriented Programming (OOP) is a programming paradigm created to deal with problems experienced by developers when creating large,
complex programs. Which of the following statements are problems that led to the creation of OOP? Select all that apply.


A
Large, complex programs can be difficult to maintain due to dependencies throughout the program.
OOP lets programmers write programs in which the different parts of the program interact, thus reducing
dependencies and facilitating maintenance.

B
Coding in a non-OO way often means writing code that is useful solely within a single context.
Defining basic classes and leveraging concepts like inheritance to introduce more detailed behaviors
provides a greater level of reusability and flexibility.

C
Complex coding problems are often difficult to break down and solve in a clear and systematic way.
Using OOP to model classes appropriate to the problem, and using real-world nouns to represent objects,
lets programmers think at a higher level of abstraction that helps them break down and solve problems.

D
Large programs involve writing a lot of code. Using OOP lets programmers write shorter programs;
with less code, OO programs run more efficiently.
=end


# Answers: A, B, C
# ***************************************************************************************************************************************

=begin
2.
Which of the following statements are true when talking about the relationship between classes and objects in Ruby? Select all that apply.

A
An object inherits methods from its class.

B
Classes act as molds or templates for objects.

C
An object's class determines its behaviors and attributes.

D
Objects are instances of a class.
=end

# Answers: B, C, D
# ***************************************************************************************************************************************

=begin
3.
Which of the following statements are true when talking about modules in Ruby? Select all that apply.

A
A mixin module provides a collection of behaviors to one or more classes.

B
Some objects in Ruby are instantiated from a module.

C
Using modules provides an alternative to class inheritance for sharing methods.

D
Modules can provide objects with a shared set of attributes.
=end

# Answers: A, C
# ***************************************************************************************************************************************

=begin
4.
Which of the following statements are true when talking about encapsulation? Select all that apply.

A
Ruby accomplishes encapsulation by creating objects and exposing interfaces (i.e. methods) to interact with those objects.

B
Encapsulation is the ability to represent data as different types.

C
Encapsulation is a way to share common behaviors between classes.

D
Encapsulation hides functionality and makes it unavailable to the rest of the code base.
=end

# Answers: A, D
# ***************************************************************************************************************************************

=begin
5.
Which of the following statements are true when talking about inheritance in Ruby? Select all that apply.

A
Ruby uses the super keyword to call methods further up the inheritance hierarchy.

B
Classes that inherit from other classes are called descendant classes.

C
A class inherits from another class by using the include keyword.

D
Inheritance is a way to form specialized classes from more general classes that already exist.
=end

# Answers: A, B, D
# ***************************************************************************************************************************************

=begin
6.
Which of the following statements about polymorphism are true? Select all that apply.

A
Polymorphism is the ability to represent data in different forms.

B
Polymorphism means hiding the implementation details of a class from objects of other classes.

C
Polymorphism is the ability to instantiate multiple objects of the same class.

D
Method overriding is one way in which Ruby implements polymorphism.
=end

# Answers: A, D
# ***************************************************************************************************************************************

=begin
7.
Which of the following are benefits of class inheritance in Ruby? Select all that apply.

A
Class inheritance lets us subclass from more than one class.

B
Class inheritance lets us extract common behaviors from multiple classes into a super class.

C
Class inheritance lets us share methods between classes that are not part of the same inheritance chain.

D
Class inheritance lets us model concepts that are naturally hierarchical.
=end

# Answers: B, D
# ***************************************************************************************************************************************

# examine the code below
class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new
=begin
8.
Which of the following statements about this code are true? Select all that apply.

A
whiskers, ginger, and paws all have identical state.

B
whiskers, ginger, and paws each reference a different Cat object.

C
whiskers, ginger, and paws all reference the same Cat object.

D
This code won't work since there is no Cat#initialize method.
=end

# Answers: A, B
# ***************************************************************************************************************************************

# examine the code below, identify all of the superclasses
class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end

=begin
9.
A
Thing

B
AnotherThing

C
SomethingElse

D
Object
=end

# Answers: A, B, D
# ***************************************************************************************************************************************

# Given the following code, select the method lookup path that Ruby will use as a result of the call to the fly method?

module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
pingu.fly

=begin
10.
A
Penguin > Bird > Animal > Object > Kernel > BasicObject > Migratory > Aquatic > Flight

B
Penguin > Aquatic > Migratory > Bird > Animal > Object > Kernel > BasicObject

C
Penguin > Migratory > Aquatic > Bird > Animal > Object > Kernel > BasicObject

D
Penguin > Bird > Animal > Migratory > Aquatic > Flight > Object > Kernel > BasicObject
=end

# Answers: C
# ***************************************************************************************************************************************

# What will the following code output?

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak

=begin
11.
A
"moooooooooooo!"

B
"Daisy says moooooooooooo!"

C
"Daisy says "

D
None of the above
=end

# Answers: B
# ***************************************************************************************************************************************

# Examine the following code:

class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")

# Which of the following statements is true about molly and max?

=begin
12.
A
They have the same state but different behaviors.

B
They have different states but the same behaviors.

C
They have different states and different behaviors.

D
They have the same state and the same behaviors.
=end

# Answers: B
# ***************************************************************************************************************************************

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

# What are @name and @age in the above code?

=begin
13.
A
Class variables

B
Local variables

C
Setter methods

D
Instance Variables
=end

# Answers: D
# ***************************************************************************************************************************************

# Examine the following Ruby code:

kate = Person.new
kate.name = 'Kate'
kate.name # => 'Kate'

# 14. Which of the following class definitions will let us run this code and get the same result? Select all that apply.

# A
class Person
  attr_accessor :name
end

# B
class Person
  attr_writer :name

  def name
    @name
  end
end

# C
class Person
  attr_reader :name

  def name=(name)
    @name = name
  end
end

# D
class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

# Answers: A, B, C, D
# ***************************************************************************************************************************************

# Examine the following Ruby code:

class Person
  attr_writer :first_name, :last_name

  def full_name
    # omitted code
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
mike.full_name # => 'Michael Garcia'

# Which of the following code snippets can replace the "omitted code" comment to produce the indicated result? Select all that apply.

# 15.
# A
@first_name + ' ' + @last_name

# B
first_name + ' ' + last_name

# C
self.first_name + ' ' + self.last_name

# D
"#{first_name} #{last_name}"

# Answers: A
# ***************************************************************************************************************************************

# Examine the following Ruby code:

class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
priya.grade # => "A"

# 16.
# The last line in the above code should return "A". Which of the following methods can we add to the Student class,
# so the code works as expected? Select all that apply.

# A
def change_grade(new_grade)
  @grade = new_grade
end

# B
def self.change_grade(new_grade)
  grade = new_grade
end

# C
def change_grade(new_grade)
  self.grade = new_grade
end

# D
def change_grade(new_grade)
  grade = new_grade
end

# Answers: A, C
# ***************************************************************************************************************************************


# On which lines in the following code does self refer to the instance of the MeMyselfAndI class referenced by i rather than the class itself?
# Select all that apply.

class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new

# 17.
# A
2

# B
4

# C
5

# D
9

# Answers: D
# ***************************************************************************************************************************************

# Examine the code below:

class SecretThing

  def share_secret
    "The secret is #{self.secret}"
  end

  private

  def secret
    "shhh.. it's a secret!!"
  end
end

SecretThing.new.share_secret # => "The secret is shhh.. it's a secret!!"

# Which of the following changes will let us return the value indicated in the comment? Select all that apply.
# 18.
=begin
A
Change the #secret method from private to protected.

B
Change the #secret method from private to public.

C
Change the #share_secret method to protected.

D
Change the #share_secret method body to "The secret is #{secret}".

# Answers: A, B, D
=end
