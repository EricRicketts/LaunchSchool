### Question 1 ###

# Every named entity in Ruby has an object_id. This is a unique identifier for that object.

# It is often the case that two different things "look the same", but they can be different objects.
# The "under the hood" object referred to by a particular named-variable can change depending on
# what is done to that named-variable.

# In other words, in Ruby everything is an object...but it is not always THE SAME object.

# Predict how the values and object ids will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  # the method #fun_with_ids creates its own self-contained scope so these are
  # the top level object_ids within the method, additoinally these variables are
  # accessible from within any block within the method

  # to be more explicit:
  # a_outer is 42 with an id of: 012 before the block.
  # b_outer is "fourty two" with an id of: 345 before the block.
  # c_couter is [42] with an id of: 678 before the block.
  # d_outer is 42 with an id of: 901 before the block.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    # There are four assignments within this times do/end block.  The assignments consist of assigning
    # the outer object ids to four variables above.  Four new objects are created which contain the
    # object ids of the outer variables.  So below, the Kernel#puts ALL of the outer ids SHOULD EQUAL
    # ALL of their corresponding outer_inner ids.

    # to be more explicit:
    # a_outer id was 012 before the block and is: 012 inside the block.
    # b_outer id was 345 before the block and is: 345 inside the block.
    # c_outer id was 678 before the block and is: 678 inside the block.
    # c_outer id was 910 before the block and is: 910 inside the block.
    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    # Now what has happened is that the outer variables, WHICH ARE ACCESSIBLE IN THE times do/end block have been assigned
    # new objects therefore they get new object ids.  However, the outer_inner varibles are still pointing to their original
    # values.  NOW ALL OF THE outer variables have DIFFERENT VALUES AND DIFFERENT OBJECT_IDS.  In all cases ?_outer_id is now
    # DIFFERENT from ?_outer.object_id 

    # to be more explicit:
    # a_outer inside after reassignment is 22 with an id of: 012 before and : 123456 after.
    # b_outer inside after reassignment is "thirty three" with an id of: 345 before and : 789012 after.
    # c_outer inside after reassignment is [44] with an id of: 678 before and : 345678 after.
    # d_outer inside after reassignment is 44 with an id of: 910 before and : 901234 after.
    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    # Now in this case 4 new variables have been created which are given copies of the newly created ?_outer objects.
    # An additional 4 new variables are created which contain the object ids of the newly created ?_inner variables, however
    # these object ids are also the same as the object ids of the reassigned ?_outer variables in lines 47-50.  So, in ALL
    # CASES ?_inner will have the same value as its corresponding ?_outer variable.  Additionally, ?_inner_id == ?_outer.object_id

    # to be more explicit:
    # a_inner is 22 with an id of: 123456 inside the block (compared to 123456 for outer).
    # b_inner is "thirty three" with an id of: 789012 inside the block (compared to 789012 for outer).
    # c_inner is [44] with an id of: 345678 inside the block (compared to 345678 for outer).
    # d_inner is 44 with an id of: 901234 inside the block (compared to 901234 for outer).
    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
  end

  # ?_outer variables now have values of 22, "thirty-three", [44], and 44.  In ALL CASES ?_outer_id != ?_outer.object_id
  # this is because ?_outer variables were reassigned within the block, however, the ?_outer_id variables were initialized
  # but never reassigned.

  # to be more explicit:
  # a_outer is 22 with an id of: 012 BEFORE and: 123456 AFTER the block.
  # b_outer is "thirty three" with an id of: 345 BEFORE and: 789012 AFTER the block.
  # c_outer is [44] with an id of: 678 BEFORE and: 345678 AFTER the block.
  # d_outer is 44 with an id of: 910 BEFORE and: 901234 AFTER the block.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."


  # all of the statements below throw an exception because variables defined within a block are not visible to a scope outside
  # the block.  So any reference to ?_inner will throw an exception.
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"

end


### Question 2 ###


# Let's look at object id's again from the perspective of a method call instead of a block.

# Here we haven't changed ANY of the code outside or inside of the block/method. We simply
# took the contents of the block from the previous practice problem and moved it to a method,
# to which we are passing all of our outer variables.

# Predict how the values and object ids will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  # In lines 143 through 151 we have variable assignment to local variables within
  # #fun_with_ids this assignment takes place at the top level scope within the method
  # explicit returns:
  # a_outer is 42 with an id of: 012 before the block.
  # b_outer is "forty two" with an id of: 345 before the block.
  # c_outer is [42] with an id of: 678 before the block.
  # d_outer is 42 with an id of: 012 before the block.  Note Integers are immutable in Ruby so their object ids are fixed.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  # the method call should not change any of these parameters because the arguments are copies of the object references
  # a_outer is 42 with an id of: 012 BEFORE and: 012 AFTER the method call.
  # a_outer is "forty two" with an id of: 345 BEFORE and: 345 AFTER the method call.
  # a_outer is [42] with an id of: 678 BEFORE and: 678 AFTER the method call.
  # a_outer is 42 with an id of: 012 BEFORE and: 012 AFTER the method call.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."

  # Exceptions are thrown because the local variables defined inside the method are not available outside of the method.
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"

end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  # Note #an_illustrative_method has access to the local variables within #fun_with_ids because they are
  # included as parameters within the method definiton.
  # In lines 181 through 184 we have variable assignment which create new objects scoped this #an_illustrative_method
  # explicit returns:
  # a_outer id was 012 before the method and is: 012 inside the method.
  # b_outer id was 345 before the method and is: 345 inside the method.
  # c_outer id was 678 before the method and is: 678 inside the method.
  # d_outer id was 012 before the method and is: 012 inside the method.
  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  # now with have variable reassignment within #an_illustrative_method, however these variables are only scoped to the 
  # #an_illustrative_method they are copies of the references supplied via the method parameters
  # explicit returns:
  # a_outer inside after reassignment is 22 with an id of: 012 before and: 01234 after.
  # b_outer inside after reassignment is "thirty three" with an id of: 345 before and: 5678 after.
  # c_outer inside after reassignment is [44] with an id of: 678 before and: 9012 after.
  # d_outer inside after reassignment is 44 with an id of: 012 before and: 3456 after.
  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."


  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  # assignment to new local variables takes place on lines 217 through 225.  These local variables are scope to
  # #an_illustrative_method.  However, these variables contain copies of the object references.  All the paramters
  # a_outer, b_outer, c_outer, and d_outer have been reassigned within #an_illustrative_method so new object ids
  # are generated.
  # explicit returns:
  # a_inner is 22 with an id of: 01234 inside the method (compared to 01234 for outer)
  # b_inner is "thirty three" with an id of: 5678 inside the method (compared to 5678 for outer)
  # c_inner is [44] with an id of: 9012 inside the method (compared to 9012 for outer)
  # d_inner is 44 with an id of: 3456 inside the method (compared to 3456 for outer)
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
end


### Question 3 ###


# Let's call a method, and pass both a string and an array as parameters and see how even though
# they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

# output:
# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
Ruby makes a copy of the object reference for method parameter passing.  So the method starts
with my_string and a_string_param both pointing to the same object, likewise my_array and
an_array_param both point to the same object.  Within the method, string concatenation, "+="
produces a new object so a_string_param points to a new object however, this leaves my_array
unaffected.  However, the shovel operator for arrays, mutates the caller, it does not create
a new object.  Thus, the object id remain the same for both my_array and an_array_param but the
value at at that memory address changes as a result of the "<<" operator.

For further clarification here, the string concatenation operation "+=" is actually reassignment
and thus creates a new object.  Thus the value for a_string_param witin the method is
"pumpkinsrutabaga", this my_string and a_string_param now point to different objects.  However,
using the array shovel operator, "<<" my_array and an_array_param still point to the same array
object, the value of that object is now changed.
=end

### Question 4 ####


# To drive that last one home...let's turn the tables and have the string show a modified output,
# while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

# output:
# My string looks like this now: "pumpkinsrutabaga"
# My array looks like this now: ["pumpkins"]
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# for the same reasons as in question 3, however, this time the roles of the string and
# array are revesed.  The String shovel operator "<<" does not create a new object it
# mutates the current object, so my_string and a_string_param are still pointing to the
# same object, now that object has a different value.  However, the array assignment in 
# the method an_array_param = ["pumpkins", "rutabaga"] creates a new object scoped to the
# method body.  Now my_array and an_array_param are pointing to different objects.

### Question 5 ###

# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# one can just return the boolean => color == "blue" || color == "green", as shown below

def color_valid_refactor(color)
  color == "blue" || color == "green"
end

# this works because a boolean expression will return a boolean value so we do not need
# the if-else-end statements.

