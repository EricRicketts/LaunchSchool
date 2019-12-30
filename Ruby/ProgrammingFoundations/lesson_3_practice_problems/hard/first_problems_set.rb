### Question 1 ###

# What do you expect to happen when the greeting variable is
# referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

=begin
greeting will return nil.  I do not understand how Ruby works
in this case.  In Ruby there is no variable declaration, the
variable must be assigned before it is used.  In the above
case the assignment never gets executed, though it exists.
In such a case Ruby assigns nil to the variable.  Also note
that if-end are keywords in Ruby so the if block scope
is the same the current scope, so the variable greeting is
not scoped as a local variable to a block following a method call. 
=end

### Question 2 ###


# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"

# the output is going to be { a: "hi there" }
puts greetings

=begin
First variable assignment takes place when the "greetings" hash
is declared.  Then a new variable assignment takes place as
"informal_greeting" gets the value of the greetings hash key of :a.
So now "informal_greeting" and the value of the hash at the key of :a
are pointing to the same object.  Thus when the String shovel operator,
"<<" is used, a new assignment is not created, but the String object
is changed (mutated).  Thus both the value for greetings hash key of :a
and the local variable "informal_greeting" now have the same value.
In essence the value for the "greetings" hash key at :a has been modified
in place (mutated).
=end


### Question 3 ###


# In other practice problems, we have looked at how the scope of variables affects
# the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope
# by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one is: one"
puts "two is: #{two}" # "two is: two"
puts "three is: #{three}" # "three is: three"

=begin
method parameters one, two, and three receive copies of the object references
of the local variables one, two, and three.  Inside #mess_with_vars reassignment
takes place so new objects are created along with new object references.  So
within the method, the local variables one, two, and three no longer point to
their orginal objects.  The local variables outside of the method remain unchaged
they are still pointing to their original objects.
=end


# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one is: one
puts "two is: #{two}" # two is: two
puts "three is: #{three}" # three is: three

=begin
Within #mess_with_vars new assignemnt takes place so new objects
are assigned to the local method variables one, two, and three.
Along with this assignemnt, come new object references.  However,
since the method parameters are copies of the object references of
the local variables outside of the method, the object references
of the local variables outside of the method remain unchanged after
the method invocation completes.  Thus, the local variables one, two,
and three remain unchaged after method invocation.
=end


# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one is: two
puts "two is: #{two}" # two is: three
puts "three is: #{three}" # three is: one

=begin
As before the method parameters one, two, and three get copies
of the variable references of the local variables one, two, three
respectively.  So both the local variable one and the method parameter
one are pointing to the same object.  The same is true for the local
variable two and the method parameter two, and the local variable three
and the method parameter three.  However, String#gsub! is a String method
which does not result in generating a new object, but in mutating the caller.
Thus the object references for all the local variables and method parameters
do not change, but the values for each object do change as a result of calling
String#gsub!.
=end


### Question 4 ###


# Ben was tasked to write a simple ruby method to determine if an input string is
# an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not
# familiar with regular expressions. Alyssa supplied Ben with a method called
# is_an_ip_number? that determines if a string is a valid ip address number and
# asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
# You're not returning a false condition, and you're not handling the case that there
# are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code

def dot_separated_ip_address?(input_string)
  dot_separated_words = input.string.split(".")
  return false unless dot_separated_words.length == 4

  for word in dot_separated_words
    return false unless is_an_ip_number?(word)
  end
  true
end

# I had the same solution as LS with only one difference, LS kept the while loop and the
# pop operation, I decided to go with a for .. in loop so that the dot_separated_words
# array would not be modified.  The problem with the original code is that no false condition
# for the method is generated when the break condition for the loop is met.  So if an ip number
# is not valid, the while loop ends and the next statement is executed with is return true.  So
# even though a false condition was flagged by breaking out of the while loop the method does
# not return false.
