require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement:

If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end
=end

class AngryCat
  def hiss
    "Hisssss!!"
  end
end

class QuestionFourTest < Minitest::Test

  def test_1
    assert_instance_of(AngryCat, AngryCat.new)
  end
end