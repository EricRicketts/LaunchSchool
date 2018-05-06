require 'byebug'

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