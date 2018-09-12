require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

You can see in the make_one_year_older method we have used self.
What does self refer to here?
=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end

  def self_is
    self.to_s
  end
end

class QuestionEightTest < Minitest::Test
  # self is the object which #make_one_year_older is
  # called on.  Note #make_one_year_older is an instance
  # method so it can only be called on instances of class Cat
  def test_1
    assert(Cat.new("Tabby").self_is.match?(/#<Cat:0x[[:xdigit:]]+>/))
  end
end