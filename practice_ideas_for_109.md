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
8.  Arrays
  1.  Write a method that removes duplicate values from an array, the array elements can be any
  object.  Do this manually.
  2.  Read about Arrays and understand all the ways one can initialize an array.
9.  Hashes
  1.  Read about Hashes and understand all the ways one can initialize a hash.

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

