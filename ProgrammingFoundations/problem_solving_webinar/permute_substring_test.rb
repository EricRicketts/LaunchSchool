require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Write a method that returns a list of all substrings in a string.  The returned list should be ordered by where
in the string the substring begins.  This means that all of the substings that begin at position 0 should start
first, then all of the substrings that begin at postion 1 and so on.  Since multiple substrings will occur at
each position, the substrings at a given position should be returned in order from shortest to longest.

Example:
substring('abcde')
[
'a', 'ab', 'abc', 'abcd', 'abcde',
'b', 'bc', 'bcd', 'bcde',
'c', 'cd', 'cde',
'd', 'de',
'e'
]

- Abstraction
- this is too hard to describe a solution in 1 or 2 sentneces
- 
=end