require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

If we call Hello.hi we get an error message.
How would you fix this?
=end

class QuestionTwoTest < Minitest::Test

  class Greeting
    def greet(message)
      message.to_s
    end
  end

  # the intent was to make the class method call
  # the instance method

  class Hello < Greeting
    def self.hi
      # "Hi from the Hello class" not author's desired answer
      greeting = Greeting.new
      greeting.greet("Hello")
    end

    def hi
      greet("Hello")
    end
  end

  class Goodbye < Greeting
    def bye
      greet("Goodbye")
    end
  end

  def test_1
    assert_equal("Hello", Hello.hi)
  end

end
