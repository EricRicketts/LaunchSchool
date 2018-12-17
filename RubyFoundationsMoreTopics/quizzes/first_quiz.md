## First Quiz Blocks

### Question 1
Which of the following statements is true when discussing closures?  Select all that apply.

A.  A closure must have an explicit name.
B.  A closure lets you save a chunk of code and execute it later.
C.  A Ruby method is a kind of closure.
D.  You can pass closures around like objects.

### Question 2
What do we mean when we say that a closure creates a binding?  Select all that apply.

A.  A closure binds to a variable.  You must use that variable to access the closure.
B.  Binding is the interaction between a method invocation and a block; the method and the block bind to each other.
C.  A closure retains access to variables, constants, and methods that were in scope at the time and location you
created the closure.  It binds some code with in-scope items.
D.  A closure retains access to the values of the variables at the time and location you created the closure.  The
closure binds to the variable values.


### Quesiton 3
Which of the following creates a closure in Ruby?

A.  Passing a block to a method.
B.  Defining a method.
C.  Creating a Proc object.
D.  Creating a lambda.

### Question 4
Which of the following situations is a good use case for writing a method that takes a block?

A.  To let methods perform some kind of before and after actions.
B.  To pass the method an array of optional arguments.
C.  To defer some implementation code until method invocation.
D.  To create methods that mutate the calling object.


### Question 5
Which of the following statements about methods that take blocks is true? Select all that apply.

A.  Methods that take a block must be part of the Ruby Core Library.
B.  Methods that take a block must be iterative methods (e.g. each, select, map).
C.  Methods that take a block must use the yield keyword in their definition.
D.  Any Ruby method can take a block.


### Question 6
Examine the following code.

```ruby
def add_one(number)
  number + 1
end

{ a: 1, b: 2, c: 3 }.each_value { |num| puts add_one(num) }
```

Which of the following statements are true?  Select all that apply.

A.  { a: 1, b: 2, c: 3 } is the calling object and puts add_one(num) is the block.
B.  each_value is the method invocation and { |num| puts add_one(num) } is the block.
C.  { a: 1, b: 2, c: 3 } is the method invocation and each_value is the method definition.
D.  each_value is the method invocation and { a: 1, b: 2, c: 3 } is the block.
E.  { a: 1, b: 2, c: 3 } and { |num| puts add_one(num) } are both blocks.
F.  { a: 1, b: 2, c: 3 } is the calling object and def add_one(number); number + 1; end is the method definition. 


### Question 7
You are writing a #welcome method that takes one argument, a string that denotes a greeting,
and a block that returns a string. The method must output the argument value followed by a
space and the value returned by the block. For example:

```ruby
welcome('Hello') { 'there' } # => Hello there
welcome('Hey') { 'Joe' } # => Hey Joe
```

So far you have the following code:

```ruby
def welcome(str)
  # missing code
end
```

Which of the following snippets can replace the missing code comment so that the method works as
described? Select all that apply.

A.  puts yield(str)
B.  puts str + ' ' + yield
C.  puts str + ' ' + (block_given? ? yield : '')
D.  puts str + ' ' + block.call

### Answers

1.  