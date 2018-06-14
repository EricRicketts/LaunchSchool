require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Diamonds

Write a method that displays a 4-pointed diamond in an n x n grid,
where n is an odd integer that is supplied as an argument to the method.
You may assume that the argument will always be an odd integer.

Examples

diamond(1)

*
diamond(3)

 *
***
 *
diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

AL:
  - am going to output a string
  - str1 = 1.upto(1).step(2)
    - for each iteration
      - number of stars = n
      - number of spaces = (diamond_number - n) / 2
  - str 2 only if rows > 1
  - rows - 2 downto 1; same algorithm as above
=end

class FifthExercise < Minitest::Test

  def diamond(rows)
    str1 = ''
    str2 = ''
    (1..rows).step(2) do |num_stars|
      spaces = (rows - num_stars) / 2
      str1 << (' ' * spaces + '*' * num_stars) + "\n"
      if rows >= 3 && num_stars < rows
        str2 << (' ' * spaces + '*' * num_stars) + "\n"
      end
    end
    (str1 + str2.split("\n").reverse.join("\n")).chomp
  end

  def test_0
    # skip
    expected = "*"
    result = diamond(1)
    assert_equal(expected, result)
  end

  def test_1
    # skip
    expected = " *\n***\n *"
    result = diamond(3)
    assert_equal(expected, result)    
  end

  def test_2
    # skip
    expected = "  *\n ***\n*****\n ***\n  *"
    result = diamond(5)
    assert_equal(expected, result)
  end

  def test_3
    # skip 
    expected = "   *\n  ***\n *****\n*******\n *****\n  ***\n   *"
    result = diamond(7)
    assert_equal(expected, result)
  end
    
  def test_4
    # skip
    expected = "    *\n   ***\n  *****\n *******\n*********\n *******\n  *****\n   ***\n    *"
    result = diamond(9)
    assert_equal(expected, result)    
  end
  
end

class FifthExerciseLS < Minitest::Test

=begin
I had to make some modifications to the LS code in order to test it and I had to make
some changes to the expects because the LS solution uses String#center to put spaces
on either side of the stars

grid_size is used to calculate max_distance which is the maximum number of spaces
that will appear on either side of the minimum number of stars.  I do not like the
way the number of stars is being calculated, instead of iterating through the stars
by odd number, the stars is taking the difference between the grid size and 2 times
the number of spaces per row.  The stars are then centered via String#centered and
the grid size

As one can see there are two steps to creating the pattern one which starts at the
top and goes to the middle line of stars, then to print the lower half of the diamond
we start with a smaller distance and move up to the max distance.
=end

  def print_row(grid_size, distance_from_center)
    number_of_stars = grid_size - 2 * distance_from_center
    stars = '*' * number_of_stars
    stars.center(grid_size) + "\n"
  end

  def diamond(grid_size)
    max_distance = (grid_size - 1) / 2
    str1 = max_distance.downto(0).map { |distance| print_row(grid_size, distance) }
    str2 = 1.upto(max_distance).map   { |distance| print_row(grid_size, distance) }
    (str1 + str2).join 
  end

  def test_0
    # skip
    expected = "*\n"
    result = diamond(1)
    assert_equal(expected, result)
  end

  def test_1
    # skip
    expected = " * \n***\n * \n"
    result = diamond(3)
    assert_equal(expected, result)    
  end

  def test_2
    # skip
    expected = "  *  \n *** \n*****\n *** \n  *  \n"
    result = diamond(5)
    assert_equal(expected, result)
  end

  def test_3
    # skip 
    expected = "   *   \n  ***  \n ***** \n*******\n ***** \n  ***  \n   *   \n"
    result = diamond(7)
    assert_equal(expected, result)
  end
    
  def test_4
    # skip
    expected = "    *    \n   ***   \n  *****  \n ******* \n*********\n ******* \n  *****  \n   ***   \n    *    \n"
    result = diamond(9)
    assert_equal(expected, result)    
  end
  
end

class FifthExerciseAlternateSoluiton < Minitest::Test

  def create_row_str(num_stars, rows)
    num_spaces = (rows - num_stars) / 2
    (' ' * num_spaces + "*" * num_stars) + "\n"      
  end

  def diamond(rows)
    str1, str2 = ['', '']
 
    (1..rows).step(2).each {|num_stars| str1 << create_row_str(num_stars, rows)}

    ((rows-2)).downto(1).select {|n| n.odd? }.map do |num_stars|
      str2 << create_row_str(num_stars, rows)
    end.join("\n")

    str1 + str2
  end

  def test_0
    # skip
    expected = "*\n"
    result = diamond(1)
    assert_equal(expected, result)
  end

  def test_1
    # skip
    expected = " *\n***\n *\n"
    result = diamond(3)
    assert_equal(expected, result)    
  end

  def test_2
    # skip
    expected = "  *\n ***\n*****\n ***\n  *\n"
    result = diamond(5)
    assert_equal(expected, result)
  end

  def test_3
    # skip 
    expected = "   *\n  ***\n *****\n*******\n *****\n  ***\n   *\n"
    result = diamond(7)
    assert_equal(expected, result)
  end
    
  def test_4
    # skip
    expected = "    *\n   ***\n  *****\n *******\n*********\n *******\n  *****\n   ***\n    *\n"
    result = diamond(9)
    assert_equal(expected, result)    
  end
  
end

class FifthExerciseFurtherExploration < Minitest::Test

  def create_row_str(num_stars, rows)
    leading_spaces = (rows - num_stars) / 2
    middle_spaces = (num_stars >= 3) ? num_stars - 2 : 0
    trailing_star = (num_stars >= 3) ? "*" : ''
    (' ' * leading_spaces + "*" + ' ' * middle_spaces + trailing_star) + "\n"      
  end

  def diamond(rows)
    str1, str2 = ['', '']
 
    (1..rows).step(2).each {|num_stars| str1 << create_row_str(num_stars, rows)}

    ((rows-2)).downto(1).select {|n| n.odd? }.map do |num_stars|
      str2 << create_row_str(num_stars, rows)
    end.join("\n")

    str1 + str2
  end

  def test_0
    # skip
    expected = "*\n"
    result = diamond(1)
    assert_equal(expected, result)
  end

  def test_1
    # skip
    expected = " *\n* *\n *\n"
    result = diamond(3)
    assert_equal(expected, result)    
  end

  def test_2
    # skip
    expected = "  *\n * *\n*   *\n * *\n  *\n"
    result = diamond(5)
    assert_equal(expected, result)
  end

  def test_3
    # skip 
    expected = "   *\n  * *\n *   *\n*     *\n *   *\n  * *\n   *\n"
    result = diamond(7)
    assert_equal(expected, result)
  end
    
  def test_4
    # skip
    expected = "    *\n   * *\n  *   *\n *     *\n*       *\n *     *\n  *   *\n   * *\n    *\n"
    result = diamond(9)
    assert_equal(expected, result)    
  end
  
end