### Question 1 ###

=begin
Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this practice problem, write a one-line program that creates the following output 10 times,
with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end

1.upto(10) {|n| puts "\s"*n + "The Flintsones Rock!"} # indents starting with 1 space
10.times {|n| puts "\s"*n + "The Flintsones Rock!"} # indents starting with 0 spaces, LS solution


### Question 2 ###

# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

=begin
An error occurs becuase there is an attempted implicit conversion
of an integer into a string with the + (40 + 2).  In Ruby one must
explicitly convert between objects.  The way to fix the problem
is shown below
=end

puts "the value of 40 + 2 is #{40 + 2}"

=begin
I was essentially correct, but LS had a better explanation and
offered two solutions to fix the problem.  One of their solutions
was exactly the one I put forth.

LS explanation:

This will raise an error TypeError: no implicit conversion of Fixnum
into String because (40+2) results in an integer and it is being
concatenated to a string.

The other LS solution was:
=end

puts "The value of 40 + 2 is " + (40 + 2).to_s


### Question 3 ###

# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop.
# How can you make this work without using begin/end/until? Note that we're not looking to find the factors for
# 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

# Bonus 1
# What is the purpose of the number % dividend == 0 ?

# Bonus 2
# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?

=begin
Failure Mechanisms:

1.  If number = 0 then number / divident is 0 / 0 whcih will throw a ZeroDivisionError
2.  If the number is negative then we will have an infinite loop, as the exit condition, dividend == 0
will never be met because the number is always becoming increasingly negative with the statement
divident -= 1.

Bonus 1
if we look at the statement:  divisors << number / dividend if number % dividend == 0
what is happening here is that if the number can be evenly divided by the dividend => number % dividend
then it is a divisor of the number.  We then calcuate the divisor by number / dividend
take an example: the number 6
in the first iteration we have 6 % 6 == 0 so the first divisor is 6/6 or 1
in the next iteration we have 6 % 5 != 0
we iterate until we get to 3 so divisor = 6 / 3 = 2
then we get to 2, so divisor = 6 / 2 = 3
finally we get to 1 do divisor = 6 / 1 = 6
Note the way the program works is that the divisors get bigger as the dividends get smaller
the developer probably did this to return the divisors in increasing numerical order

Bonus 2
the next to last statement in the method, divisors, just returns an array of divisors

The fix to the program is below (note my fix is exactly what the LS solution provided)

LS also went into greater detail about the return of the program, the second to last statement
is required in this case because unless an explicit return statement is in the code, Ruby will
return the last statement executed which is the end of the while loop.  A while loop always
returns nil so the output of the method would be nil
=end

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

### Question 4 ###

# Alyssa was asked to write an implementation of a rolling buffer.
# Elements are added to the rolling buffer and if the buffer becomes full,
# then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?".
# Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=begin
The biggest difference between the two methods is that rolling_buffer1 mutates
the buffer parameter it does this with buffer << new_element and with 
buffer.shift if buffer.size > max_buffer_size.  Actually, the last line
of rolling_buffer1 is not needed because the incoming object, buffer will
be changed once the method executes.

In the case of rolling_buffer2, the input buffer, input_array is not altered
instead a new variable is created on the first line of the method, buffer =
input_array + [new_element] this new variable, buffer is modified by the Array#shift
method on the second line of the method.  It is necessary for the buffer variable
to be returned in the last line of the method or else the newly modified rolling
buffer will not be made available to any outside variable.

In essence rolling_buffer1 produces a side effect, that is argument passed in at
method invocation for the buffer parameter will be changed once the method executes.

There are no side effects in rolling_buffer2.

Note my explanation was the same as the LS explanation but mine went into more detail.
=end


### Question 5 ####


# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator,
# A user passes in two numbers, and the calculator will keep computing the sequence
# until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error.
# Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# How would you fix this so that it works?

=begin
The error will be 'undefined method or local variable limit'.  This occurs because methods
create their own scope outside of the flow of normal execution, thus they do not have access
to local variables initialized outside of their scope.  In order to have access to local
variables, methods need to offer access via their parameter list in the method definition.

In this case the fix is just to add limit to the parameter list.  The new method is shown below

My answer is the same as the LS solution but more verbose
=end

limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"


### Question 6 ###

# In an earlier practice problem we saw that depending on variables to be modified by called methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# We learned that whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.

# How can we refactor this practice problem to make the result easier to predict and easier for the next programmer to maintain?

=begin
Based on the code following the method definition, it looks like the user desires a side effect on each of the incoming string
and array.  I say this because the puts method has the string "My string looks like this now".

It turns out my solution is full of flaws not only should be generally avoid side effects but it only returns the modified array
=end

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
Below is the LS solution, no side effects, returns both the string and the array the original values are unmodified
unless used in an assignment statement as they are below.
=end

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


### Question 7 ###


# What is the output of the code below?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

=begin
the output is going to be 42 - 8 = 34

within #mess_with_it a new object is created and returned
with the assignment statement.  new_answer will be given the
value of 50, but this method will not affect the answer variable
=end


### Question 8 ###

# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?

=begin
Yes, the data did get modified, now all of the ages are increased by 42 and all gender data is now "other".
This is much like modifying individual elements of an array, the object id of the entire hash did not change
however, the individual values of each of the keys did change, because new objects were assigned to the 
existing keys in the method.  Note the keys did not change they remain the names of the family memmbers, but
the values for each key, which are themselves hashes were given new data via assignment in the method.
=end


### Question 9 ###

# Method calls can take expressions as arguments. Suppose we define a function called rps as follows,
# which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares
# whatever hand was used in the tie as the result of that tie.

def rps(fist1, fist2)
  # so this first condition handles 1) "rock", "paper" 2) "rock", "scissors" 3) "rock", "rock"
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  # this condition handles 1) "paper", "scissors" 2) "paper", "rock" 3) "paper", "paper"
  elsif fist1 == "paper" 
    (fist2 == "scissors") ? "scissors" : "paper"
  else
  # this condition handles 1) "scissors", "rock" 2) "scissors", "paper" 3) "scissors", "scissors"
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

=begin
working from the inside out:
rps("rock", "scissors") = "rock"

now we have:
rps(rps(rps("rock", "paper"), "rock"), "rock")

now rps("rock", "paper") = "paper"

now we have:
rps(rps("paper", "rock"), "rock")

rps("paper", "rock") = "paper"

finally
rps("paper", "rock") = "paper", this is correct!!
=end


### Question 10 ###

# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)

=begin
to begin with foo will always return "yes"

so we now have bar("yes")

so the ternary in bar:
param == "no" ? "yes" : "no"

will evaluate to "no", this is what should be return value => "no"
=end






