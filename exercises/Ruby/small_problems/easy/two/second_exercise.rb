require 'byebug'

=begin
How Big Is The Room?

Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

Straightforward but need to ask, how many decimal places, I added
round(2) after looking at the solution

=end

  SQ_M_TO_SQ_FT = 10.7639

  def area_of_room
    puts "Enter the length of the room in meters:"
    length = gets.chomp.to_f
    puts "Enter the width of the room in meters:"      
    width = gets.chomp.to_f

    area_in_sq_m = (length * width)
    area_in_sq_ft = (area_in_sq_m * SQ_M_TO_SQ_FT)
 
    puts "The are of the room is #{area_in_sq_m.round(2)} square meters " +
    "(#{area_in_sq_ft.round(2)} square feet)."
  end

  area_of_room 

