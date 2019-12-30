require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SecondExercise < Minitest::Test

  def lower_pattern(string, grid, iterations)
    inside_spaces = 0
    iterations.times do
      string += ("*" + ' '*inside_spaces + "*" + ' '*inside_spaces + "*").center(grid) + "\n"
      inside_spaces += 1
    end
    string
  end

  def upper_pattern(string, grid, iterations)
    num_stars = 3
    inside_spaces = (grid - num_stars) / 2
    iterations.times do
      string += ("*" + ' '*inside_spaces + "*" + ' '*inside_spaces + "*").center(grid) + "\n"
      inside_spaces -= 1
    end
    string
  end

  def star(n)
    partition_number = n / 2
    lower = 1.upto(partition_number).map {|n| n}
    upper = partition_number.downto(1).map {|n| n}
    str = upper_pattern('', n, partition_number)
    str += "*"*n + "\n"
    str += lower_pattern('', n, partition_number)
  end

  def test_1
    expected = "*  *  *\n" +
    " * * * \n" + "  ***  \n" +
    "*******\n" + "  ***  \n" +
    " * * * \n" + "*  *  *\n"
    assert_equal(expected, star(7))
  end

  def test_2
    expected = "*   *   *\n" +
      " *  *  * \n" + 
      "  * * *  \n" +
      "   ***   \n" +
      "*********\n" +
      "   ***   \n" +
      "  * * *  \n" +
      " *  *  * \n" +
      "*   *   *\n"
    assert_equal(expected, star(9))    
  end
  
end