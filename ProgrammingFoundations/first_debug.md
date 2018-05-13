### Get The Correct Assignment

A developer notices when using irb that multiple assignments work in Ruby:

```ruby
a, b = 1, 2
# assigns 1 to a and 2 to b
# and returns [1, 2] as a result
# of the assignment 
# in irb:
# 2.5.0 :010 > a, b = 1, 2
#  => [1, 2]
# > a
# => 1
# > b
# => 2 
# 2.5.0 :011 > 
```

So the developer decideds to make an assignment and capture the result
of the assignment in one fell swoop:

```ruby
y = a, b, c = 1, 2, 3
```

What will be the actual result of this assignment, that is what will be
assigned to the variable y, and each of the variables a, b, and c?

How does the developer fix the above code to obtain his/her original intent?

Answer:

y, a, b, and c will be the following:

```ruby
# y = [1, 2, 1, 2, 3]
# a = 1
# b = 2
# c = 1
```

A fix would be:

```ruby
y = (a, b, c = 1, 2, 3)
# this will return
# y = [1, 2, 3]
# a = 1
# b = 2
# c = 3
```

Explanation:

They way to think of the developer's mistake is to view the assignment to y
as one large assigment and work "from the top down" to get the values for
a, b, and c:

```ruby
# think of the developers statement as one long assignment to y
# so instead of something like y = 1, 2, 3, 4, 5 we have:
# y = a, b, c = 1, 2, 3, so y is assigned a 5 element array
# literal consisting of [a, b, c, 2, 3] now we need to resolve
# a, b, and c.  From the secondary assignment a, b, c = 1, 2, 3
# a is set to 1, b is set to 2 and c is explicitly set to 1 by
# c = 1.  2 and 3 are the remaining elements left over in the
# array literal assignment to y.
```




