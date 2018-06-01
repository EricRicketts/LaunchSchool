require 'byebug'

### Question 1 ###

# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin
output will be
1
2
2
3

this is because numbers.uniq returns a new array
and this new array lacked assignment to a local variable.

Thus the original numbers array remains unchaged.  I had
to read about #puts, if given an array argument it will
print out all the array elements on separate newlines

note for arrays, Array#to_s is an alias to Array#inspect
and the #p does this #inspect conversion automatically

so puts ary.inspect will print out [1, 2, 2, 3] as will
p ary and puts ary.to_s  
=end

### Question 2 ###

=begin
Describe the difference between ! and ? in Ruby.
And explain what would happen in the following scenarios:

1.  what is != and where should you use it?
2.  put ! before something, like !user_name
3.  put ! after something, like words.uniq!
4.  put ? before something
5.  put ? after something
6.  put !! before something, like !!user_name

the ! is a boolean operator when used in conditional statements,
when used in method names by convention it means the method is
destructive, that is it can mutate the caller.

the ? is used by convertion in method names indicating the method
returns a boolean value.  It is also used in ternary conditional
statements so <boolean expression> ? true : false where it proceeds
the return value when the boolean expression evaluates to true.  It
is also used in regular expression to indicate 0 or 1 of the preceeding
pattern and it is used in lookahead and lookbehind expressions.

1.  != is object 1 Not Equal object 2, a != b returns true when
the objects are not equal to one another

2.  when ! preceeds an object, as !user_name then the object
is converted into a false value unless it was nil or false to begin with

3.  if ! is placed after something, particularly a method name then it
signals to the user the caller will be mutated.  For instance Array#uniq!
uniquifies the reciever it does not return a new uniquified object.

4.  Unless ? is used in a ternary statement it does not mean anything
when placed before something

5.  If ? is placed after something, particularly a method name then by
convention it indicates a boolean value will be returned

6.  !! placed before something converts the object to Boolean true
unless it was nil or false to begin with in such case false would
be returned

LS answers:

Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax.
Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the
method implementation. The other uses are actual Ruby syntax:

!= means "not equals"
? : is the ternary operator for if...else
!!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
!<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.


=end

### Question 3 ###

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub('important', 'urgent') # global replacement 
advice.sub('important', 'urgent') # if just one replacement needed


### Question 4 ###

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)

# the above method Array#delete_at removes an element at the given index, Ruby assumes the
# argument is an index.  Only one element of the array will be removed in this case Array#delete_at
# will return the number 2 because it is deleting at index 1.  The array will be modified and will
# now be [1, 3, 4, 5]

numbers = [1, 2, 3, 4, 5]

numbers.delete(1)

# Array#delete removes all occurrences of the element within the array.  It just retruns one
# copy of the element deleted if there are more than one of the same elements.  In this case
# Array#delete will return 1 and the array will now be [2, 3, 4, 5]

# Both Array#delete_at and Array#delete mutate the caller 

numbers = [1, 2, 3, 4, 5]


### Question 5 ###

# Programmatically determine if 42 lies between 10 and 100.

(10..100).include?(42) # tells whether the object is part of the range
(10..100).cover?(42) # tells whether begin <= object <= end if Range#exclude_end? is false
# or tells whether begin <= object < end if Range#exclude_end? is true


### Question 6 ###

# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

famous_words.prepend("Four score and ")

famous_words = "seven years ago..."

famous_words.insert(0, 'Four score and ')

famous_words = "seven years ago..."

# I misunderstood the problem LS wanted any way to insert "Four score and " in
# front of "seven years ago...".  LS answers are shown below.  I thought only
# a mutated string was allowed, not using methods that also produced a new
# string object

=begin
"Four score and " + famous_words
or
famous_words.prepend("Four score and ")
or
"Four score and " << famous_words
=end


### Question 7 ###

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# gives us the string below:
# "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

# If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call

eval(how_deep)

# what will be the result?

=begin
#add_eight was called 5 times and the original number was 2

1. add_eight(2) = 10
2. add_eight(10) = 18
3. add_eight(18) = 26
4. add_eight(26) = 34
5. add_eight(34) = 42

another way to look at it is 5*8 + 2 = 42
=end


### Question 8 ###

# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.

flintstones.flatten!


### Question 9 ####

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones.slice('Barney').to_a.flatten

# LS solution which is much better
flintstones.assoc("Barney")



