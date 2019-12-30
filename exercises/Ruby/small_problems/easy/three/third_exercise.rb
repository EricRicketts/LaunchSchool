require 'byebug'

=begin
Counting The Number Of Characters

Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

input:

Please write word or multiple words: walk
output:

There are 4 characters in "walk".
input:

Please write word or multiple words: walk, don't run
output:

There are 13 characters in "walk, don't run".
=end

def count_chars
  puts "Please write word or multiple words:"
  words = gets.chomp

  num_chars = words.gsub(/\s+/,'').length
  # for a simple input like this one could use
  # num_chars = words.delete(' ').length but delete must
  # use a string and not a regex
  puts "There are #{num_chars} characters in \"#{words}\"."
end

count_chars