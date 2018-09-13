require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

If we have this code:

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

What happens in each of the following cases:

case 1:

hello = Hello.new
hello.hi

case 2:

hello = Hello.new
hello.bye

case 3:

hello = Hello.new
hello.greet

case 4:

hello = Hello.new
hello.greet("Goodbye")

case 5:

Hello.hi
=end

class QuestionOneTest < Minitest::Test

  class Greeting
    def greet(message)
      message.to_s
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

  attr_accessor :hello

  def setup
    @hello = Hello.new
  end

  def test_1
    # this is easy, calls Hello#hi which call #greet
    # with "Hello" as an argument
    assert_equal("Hello", hello.hi)
  end

  def test_2
    # Hello#bye does not exist
    assert_raises(NoMethodError) { hello.bye }
  end

  def test_3
    # Hello#greet does exist as it is inherited from
    # Greeting, however it requires one argument and
    # none was given
    assert_raises(ArgumentError) { hello.greet }
  end

  def test_4
    # Hello#greet was inherited from Greeting, it needs
    # one argument and "Goodbye" was that argument
    assert_equal("Goodbye", hello.greet("Goodbye"))
  end

  def test_5
    # there is no class method hi
    assert_raises(NoMethodError) { Hello.hi }
  end
end
