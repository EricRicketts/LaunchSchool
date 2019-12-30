# 1.  Locate the ruby documentation for methods File::path and File#path. How are they different?

=begin
1.  In File::path, the method is called on the class, File, it needs an argument, a string
which represents the file path and then Ruby will return the string representation of the path.

2.  In File#path, the method is called on an instance of File.  In this case Ruby returns
a string representation of the pathname used to create the file.

In the class method, a string will always be returned, this is not guaranteed in the instance method.
=end

=begin
7.  Use irb to run the following code:

s = 'abc'
puts s.public_methods.inspect

You should find that it prints a list of all of the public methods available to the String s; this includes
not only those methods defined in the String class, but also methods that are inherited from Object
(which inherits other methods from the BasicObject class and the Kernel module). That's a lot of methods.

How would you modify this code to print just the public methods that are defined or overridden by the String class?
That is, the list should exclude all members that are only defined in Object, BasicObject, and Kernel.

s.public_methods(false).inspect
=end

=begin
9.  Sometimes, the documentation is going to leave you scratching your head.

In a very early assignment at Launch School, you are tasked with writing a
program that loads some text messages from a YAML file. We do this with YAML::load_file:

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

Find the documentation for YAML::load_file.

I found a reference to Psych in the Ruby documentation, it has
Psych::load_file
=end

require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExercisesDocumentation < Minitest::Test

  def my_method(a, b = 2, c = 3, d)
    [a, b, c, d]
  end

  def test_date_exercise_2
    d1 = Date.new
    d2 = Date.new(2016)
    d3 = Date.new(2016, 5)
    d4 = Date.new(2016, 5, 13)

    assert_equal([-4712, 1, 1], [d1.year, d1.month, d1.day])
    assert_equal([2016, 1, 1], [d2.year, d2.month, d2.day])
    assert_equal([2016, 5, 1], [d3.year, d3.month, d3.day])
    assert_equal([2016, 5, 13], [d4.year, d4.month, d4.day])
  end

  def test_method_arguments_exercise_3
    result = my_method(4, 5, 6)
    assert_equal([4, 5, 3, 6], result)
  end

  def test_array_bsearch_exercise_4
    result = [1, 4, 8, 11, 15, 19].bsearch { |n| n > 8 }
    assert_equal(11, result)
  end

  def test_fetch_exercise_5
    a = %w[a b c d]
    assert_raises(IndexError) { a.fetch(7) }
    assert_equal('beats me', a.fetch(7, 'beats me'))
    assert_equal(49, a.fetch(7) { |index| index**2 })
  end

  def test_step_range_exercise_6
    ary = []
    5.step(to: 10, by: 3) { |value| ary << value }
    assert_equal([5, 8], ary)
  end

  def test_array_min_exercise_8
    a = [5, 9, 3, 11]
    assert_equal([3, 5], a.min(2))
  end
end