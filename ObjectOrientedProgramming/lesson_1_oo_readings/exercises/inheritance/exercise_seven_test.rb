=begin
Create a class 'Student' with attributes name and grade.
Do NOT make the grade getter public, so joe.grade will
raise an error. Create a better_grade_than? method,
that you can call like so...

puts "Well done!" if joe.better_grade_than?(bob)
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Student

  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    self.get_grade > other_student.get_grade
  end

  protected

  def get_grade
    @grade
  end

end

class ExerciseSevenTest < Minitest::Test

  def setup
    @joe = Student.new("Joe", 90)
    @bob = Student.new("Bob", 80)
  end

  def test_1
    # skip
    assert(@joe.better_grade_than?(@bob))
  end

end
