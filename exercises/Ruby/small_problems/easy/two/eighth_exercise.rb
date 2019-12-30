require 'byebug'
=begin
Sum Or Product Of Consecutive Integers

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
=end

def sum_or_product
  puts "Please enter an integer greather than 0:"  
  int = gets.to_i
  puts "Enter 's' to compute the sum, 'p' to compute the produce."
  op = gets.chomp

  case op
  when 's'
    puts "The sum of integers between 1 and #{int} is #{(1..int).reduce(&:+)}."
  when 'p'
    puts "The product of integers between 1 and #{int} is #{(1..int).reduce(&:*)}."
  else
    puts "not a recognized operation."
  end
end

sum_or_product