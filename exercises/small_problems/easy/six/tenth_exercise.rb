require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Right Triangles

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars.
The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle,
and the other end at the upper-right.

Examples:

triangle(5)

    *
   **
  ***
 ****
*****
triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

AL:
  - n = 5
  - lines:
    - 4 spaces; 1 star
    - 3 spaces; 2 stars
    - 2 spaces; 3 starts
    - 1 space;  4 stars
    - 0 spaces; 5 stars

    - stars go from 1 to 5
    - spaces go from 4 to 0
      - spaces are 5 - n

    1.upto(5) do |n|
      puts spaces*(5 - n) + star*n
    end
=end
  
  def triangle(base)
    1.upto(base) do |num_stars|
      puts " "*(base - num_stars) + "*"*num_stars
    end
  end

  triangle(5)
  puts
  triangle(9)
  puts

  def triangle_ls(num)
    spaces = num - 1
    stars = 1

    num.times do |n|
      puts (' ' * spaces) + ('*' * stars)
      spaces -= 1
      stars += 1
    end
  end

  triangle_ls(5)
  puts
  triangle_ls(9)
