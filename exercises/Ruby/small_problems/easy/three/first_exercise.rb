require 'byebug'

=begin
Searching 101

Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

Examples:

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

=end
def find_number_in_arr
  arr = []
  suffixes = {1 => 'st', 2 => 'nd', 3 => 'rd', 4 => 'th', 5 => 'th'}
  1.upto(5) do |n|
    puts "Enter the #{n.to_s + suffixes[n]} number:"
    arr << gets.to_i   
  end
  puts "Enter the last number:"
  num = gets.to_i

  appear_phrase = arr.include?(num) ? " appears " : " does not appear "
  puts "The number #{num}" + appear_phrase + "in #{arr.inspect}."
end

find_number_in_arr