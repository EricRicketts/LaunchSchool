require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

What is the default return value of to_s when invoked on an object?
Where could you go to find out if you want to be sure?
=end

class Foo
  attr_accessor :bar

  def initialize(bar)
    @bar = bar
  end
end

class QuestionSevenTest < Minitest::Test

  def test_1
    # returns the object's class and object id
    # it is from Object#to_s documentation
    assert(Foo.new("bar").to_s.match?(/#<Foo:0x[[:xdigit:]]+>/))
  end
end