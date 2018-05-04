require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FirstExercise < Minitest::Test

=begin
How Old Is Teddy?

Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

Example Output

Teddy is 69 years old!

=end
  def teddy_age
    "Teddy is #{rand(20..200)} years old!"
  end

  def test_string
    str = teddy_age
    m = str.match(/\d+/)
    age = m[0].to_i
    assert(age >= 20 && age <= 200)
  end
  
end