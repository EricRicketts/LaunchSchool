require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model
=end

class QuestionFiveTest < Minitest::Test

  class Television
    def self.manufacturer
      "Samsung"
    end

    def model
      "there is no instance variable"
    end
  end

  attr_accessor :tv

  def setup
    @tv = Television.new
  end

  def test_1
    # there is no instance method Television#manufacturer so
    # an exception is thrown
    assert_raises(NoMethodError) { tv.manufacturer }
  end

  def test_2
    # the problem with this solution is that there is no instance
    # variable so the model cannot be permanently stored on the object
    assert_equal("there is no instance variable", tv.model)
  end

  def test_3
    # this is a valid call to the class, however, if the intent
    # is to have a number of different manufacturers for the Television
    # class then even using a class variable will not work
    assert_equal("Samsung", Television.manufacturer)
  end

  def test_4
    # there is no class method Television::model so an excepttion is raised
    assert_raises(NoMethodError) { Television.model }
  end

end
