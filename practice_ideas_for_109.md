## Pratice Ideas for 109 Assessment

### Programming Ideas
1.  Learn what combinations are and write a method which reproduces the Array#combination
2.  Learn what permutations are and write a method which reproduces the Array#permutation
3.  Write a method which produces the substrings for a given string and the user can specify
the minimum length of each substring, default to 1 character
4.  Write a method which produces the substrings for a given string and the user can specify
the substring length
5.  Write a method which produces the substrings for a given string and the user can specify
where to begin the substrings (by a postion in the string with 1 being the first character)
and the desired substring length
6.  Primes
	1.  Write a method which generates the first n primes
	2.  Write a method which generates all of the primes up to a certain number
	3.  Write a method which checks to see if a number is a prime number
	4.  Write a method which performs the prime factorization of a number, but
	stores the factorization in the format [prime_number, number_of_appearances],
	so the prime factorization of 12 = 2*2*3 or [[2, 2], [3, 1]]
7.  Numbers
	1.  Write a method which produces the Greatest Common Divisor between two numbers
	2.  Write a method which produces the Least Common Multiple between two numbers
	3.  Write a method which produces the nth Fibonacci number, do not do it with recursion
  4.  Write a method which produces the first Fibonacci number by length, Small Problems, Easy
  5.  Write a method which picks off the digits of a number and puts them into an array
  Set Six, Exercise 3.
  5.  Write a method which produces all the Fibonacci numbers by a given length, that is their
  index.  At the users option return the actual numbers in an array.
  6.  Understand in detail how integer division and integer modulus works for both positive and
  negative numbers.
8.  Arrays
  1.  Write a method that removes duplicate values from an array, the array elements can be any
  object.  Do this manually.
  2.  Read about Arrays and understand all the ways one can initialize an array.
  3.  Make up some problems where you move through hierarchical arrays.
9.  Hashes
  1.  Read about Hashes and understand all the ways one can initialize a hash.
  2.  Make up some problems where you move through hierarchical hashes
10.  Strings
  1.  Study and undersand how to use #format
11.  Data Structures
  1.  Make up some problems where you move through hierarchical mixed data structures of arrays
  and hashes
  2.  In particular go back through the problems in assignment 5, Lesson 5: Advanced Ruby Collections
  for 101: Programming Foundations
  3.  Write the code to convert the current data structure to the desired data structure for question 8
  of the Lesson 5 (Advanced Ruby Collections) Quiz 
  4.  Be able to step through and explain the code for Lesson 5 (Advanced Ruby Collections) Quiz Questions 8-10

### Code Reading Ideas
1.  Go through Lesson 3 and do all the code reading problems again
2.  Go through any of the code reading sections on the quizzes

```ruby
# describe what this code does
# line by line
class A
  def val
    10
  end

  def test
    back = []
    x = val
    back << x
    val = x + 1
    back << val
    x = val
    back << x
  end
end

p A.new.test

# what does this code print
# out and why?
class B
  def val
    10
  end

  def test
    val = val
  end
end

p B.new.test
```

### Revew Problems - Easy
1.  Small Problems, Easy Set Four, Exercise 2, What Century is That?
2.  Small Problems, Easy Set Four, Exercise 3, Leap Years (Part 1)
3.  Small Problems, Easy Set Four, Exercise 8, Convert A String To A Signed Number
4.  Small Problems, Easy Set Four, Exercise 10, Convert A Signed Number To A String
5.  Small Problems, Easy Set Five, Exercise 2, After Midnight (Part 1), Further Exploration
6.  Small Problems, Easy Set Five, Exercise 3, After Midnight (Part 2), Further Exploration
7.  Small Problems, Easy Set Five, Exercise 9, ddaaiillyy ddoouubbllee do both regular problem and Further Exploration
8.  Small Problems, Easy Set Six, Exercise 1, Cute Angles, Further Exploration
9.  Small Problems, Easy Set Six, Exercise 5, Reversed Arrays (Part 2)
10. Small Problems, Easy Set Seven, Exercise 6, Staggered Caps (Part 2), Further Exploration
11. Small Problems, Easy Set Seven, Exercise 9, Multiply All Pairs
12. Small Problems, Easy Set Eight, Exercise 8, Double Char (Part 2)
13. Small Problems, Easy Set Eight, Exercise 10, Get The Middle Character
14. Small Problems, Easy Set Nine, Exercise 2, Double Doubles
15. Small Problems, Easy Set Nine, Exercise 8, Sequence Count

### Notes from Julius Zerwick Blog Post "You Need An Interview Script"
1. Link
2. Read the problem and "load it into your brain"
   a. Critical part here is to make sure you understand what you are begin asked to do.
   b. Break down the problem statement and consider rewriting it for better understanding.
   c. If appropriate provide examples to the interviewer to validate your understanding of the problem.
3. Write Out Your Approach In A Step By Step Process
   a. First describe a high level approach to solving the problem in plain English.
   b. Then take your description and break it down into unique steps, with each step numbered, keep the steps in English.
4. If no tests are provided, write out some with the expected output
   a. In contrast to 2.c. these tests are more thorough and cover any edge cases.
   b. Use these test cases as a final clarification to your understanding of the problem.
5. Layout Your Rough Draft Of The Problem With Pseudocode (given Ruby's expressiveness this may not be required) 
6. Rewrite Your Solution In Actual Code
7. Test Your Code, Fix Any Errors, Get All Tests To Pass
8. Once All The Tests Pass, Refactor Your Code

### Notes From Debugging Webinar
1. General Approach
   a. Make an effort to fully understand the error
      i.  Trap the error
      ii. What inputs produce the error?
   b. Reproducing the error consistently is going to be the vast majority of the work in debugging, especially with more complicated programs
   c. Understand the problem holistically, do not just squash the symptoms of the problem
   d. Pay attention to "code smells" many times they are the source of the problem though it may not appear so right away
   e. Recognizing "code smells" comes with experience
 2. Tools
   a. Pay attention to the return value, especially when iterating over collections
   b. Understand the difference between puts and p, p uses inspect while puts uses to_s
   c. A debugger is very useful on much larger and more complex programs
   d. Consider "rubber ducking" to better understand the problem
   e. Make sure any code you add DOES NOT CHANGE the return values of a method or alter your code from its expected behavior, like inserting a puts
   at the end of a select method


