require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
print_in_box('')
+--+
|  |
|  |
|  |
+--+
You may assume that the input will always fit in your terminal window.

AL:
  - determine string size
    - string will be buffered by a "|" and a " " before and after the string
    - buffer is 4 characters
    - top will be "+" + "-" + "-"*string.length + "-" + "+"
    - next line will be "|" + " " + " "*string.length + " " + "|"
    - next line will be "|" + " " + #{string} + " " + "|"
    - repeat line 2
    - repeat line 1
=end

def print_in_box(str)
  string_length = str.length
  puts "+" + "-" + "-"*string_length + "-" + "+"
  puts "|" + " " + " "*string_length + " " + "|"
  puts "|" + " " + str + " " + "|"
  puts "|" + " " + " "*string_length + " " + "|"
  puts "+" + "-" + "-"*string_length + "-" + "+"  
end

print_in_box('To boldly go where no one has gone before.')
puts
print_in_box('')