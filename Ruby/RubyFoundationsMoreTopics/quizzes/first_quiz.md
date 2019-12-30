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


### Question 8
Which of the following statements about block parameters and arguments is true? Select all that apply.

	A.  For every parameter in the block parameter list, you must pass an argument.
	B.  You can pass more arguments than the block parameter list shows.
	C.  You can pass fewer arguments than the block parameter list shows. The omitted arguments will be nil.
	D.  You can pass fewer arguments than the block parameter list shows, but you can't access the parameters inside the block.


### Question 9
What does the following error mean? Select all that apply.

`LocalJumpError: no block given (yield)`

	A.  You have invoked a method that yields to a block, but you haven't passed enough arguments to the block.
	B.  You have invoked a method without a block, but the method yields to a block.
	C.  You have invoked a method with a block, but the method doesn't yield to a block.
	D.  You have invoked a method that yields to a block, but you passed more arguments than the block defines in its parameter list.

### Question 10
Which of the following statements are true?

	A.  If a method is called with a block, block_given? converts the block to a Proc object and returns it.
	B.  block_given? is a method of Kernel.
	C.  If a method is called without a block, block_given? returns nil.
	D.  If you use yield in a method, you must always test the return value of block_given?.
	E.  If a method is called without a block, block_given? returns false.
	F.  block_given? is a method of BasicObject.

### Question 11
Examine the code below:

```ruby
def true_or_false(&block)
  puts "The block is #{block.call}"
end

true_or_false { 5 > 8 }
```

Which of the following statements about &block is true? Select all that apply.

	A.  It lets you explicitly pass in the block to the method.
	B.  It converts the block to a symbol and assigns it to a local variable.
	C.  It converts the block to a Proc object and assigns it to a local variable.
	D.  It lets you implicitly pass in the block to the method.


### Question 12
Examine the following code:

```ruby
def call_chunk(code_chunk)
  code_chunk.call
end

say_color = Proc.new {puts "The color is #{color}"}
color = "blue"
call_chunk(say_color)
```

Which of the following statements about this code is true? Select all that apply.

	A.  The local variable color is part of the Proc object's binding.
	B.  This code will raise an error since the closure created by say_color doesn't include color as part of the binding.
	C.  This code will raise an error since line 2 should say yield code_chunk instead of code_chunk.call.
	D.  If you swap lines 5 and 6 with each other, this code will run and output The color is blue.


### Question 13
Examine the code below:

```ruby
"the cat in the hat".split.map(&:capitalize).join(' ') # => "The Cat In The Hat"
```

What method does Ruby use to expand the `&:capitalize` argument passed to `#map`?

	A.  Block#to_proc
	B.  Symbol#to_block
	C.  Symbol#to_proc
	D.  Proc#to_block


### Question 14
Examine the code below:

```ruby
[2, 3, 5].inject(1, &:+)
```

Which of the following implementations matches this code? Select all that apply.

	A.  [2, 3, 5].inject(1) { |total, num| num + num }
	B.  [2, 3, 5].inject { |total, num| total + num }
	C.  [2, 3, 5].inject { |total, num| num + num }
	D.  [2, 3, 5].inject(1) { |total, num| total + num }


### Question 15
Consider the following code:

```ruby
ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  # block body
end
```

Which of the following names is part of the binding for the block body? Select all that apply.

	A.  ARRAY
	B.  abc
	C.  collection
	D.  a
	E.  xyz

### Answers

1.   B, D
2.   C
3.   A, C, D
4.   A, C
5.   D
6.   B, F
7.   B, C
8.   B, C
9.   B
10.  B, E
11.  A, C
12.  B, D
13.  C
14.  D
15.  A, B, E