## Second Quiz Introduction To Testing

### Question 1
A primary reason for writing tests is regression testing. What do we mean by regression tests, and why are they useful?


A.  Regression tests check the integration between small pieces (or units) of code with the wider code base. They help ensure that the integration between units works.

B.  Regression tests check for bugs that occur in formerly working code after you make changes somewhere in the codebase. Using tests to identify these bugs means we don't have to verify that everything works manually after each change.

C.  Regression tests check the specific functionality of a small piece (or unit) of code. They test that unit in isolation to ensure it works.

D.  Regression tests check new features that we add to a program to determine whether they work.


### Question 2
Match the following descriptions to the most appropriate list of terms:

A verification step to confirm that the results returned by a program or application match the expected results.
A group or set of situations or contexts within which verification checks are made.
A situation or context in which verification checks are made. For example, making sure you get an error message after trying to log in with the wrong password. May require multiple steps.

A.  (1) Assertion, (2) Test, (3) Test Suite

B.  (1) Assertion, (2) Test Suite, (3) Test

C.  (1) Test, (2) Assertion, (3) Test Suite

D.  (1) Test, (2) Test Suite, (3) Assertion

E.  (1) Test Suite, (2) Test, (3) Assertion

F.  (1) Test Suite, (2) Assertion, (3) Test


### Question 3
Which of the following statements about MiniTest and RSpec is true?


A.  RSpec runs multiple tests at once; MiniTest runs them one at a time.

B.  MiniTest comes installed with Ruby; RSpec doesn't.

C.  RSpec uses the SEAT approach to testing; MiniTest doesn't.

D.  MiniTest lets you use normal Ruby syntax; RSpec is a DSL that uses code that reads like natural English.


### Question 4
Read the following descriptions:

Instantiate any objects that will be used in the tests.

Affirm the results of code execution.

Which two steps in the SEAT approach do these statements describe?


A.  Set Up

B.  Execute

C.  Assert

D.  Tear Down


### Question 5
Read the following descriptions:

Clean up any lingering artifacts.

Run code against the object being tested.

Which two steps in the SEAT approach do these statements describe?


A.  Set Up

B.  Execute

C.  Assert

D.  Tear Down


### Question 6
Which of the following statements is true regarding the Set Up and Tear Down steps of the SEAT approach?


A.  When instantiating objects in a setup method, we should assign them to local variables.

B.  Including Set Up and Tear Down steps reduces redundancy in the Test Suite code.

C.  The setup and teardown methods execute once each, regardless of how many tests the test suite contains.

D.  The setup method runs before each test and the teardown method after each test.


### Question 7
How does assert_equal test for equality?


A.  It compares the objects using the `#==` method.

B.  It compares the objects using the `#===` method.

C.  It compares the objects using the `#eql?` method.

D.  It compares the objects using the `#equal?` method.


### Question 8
You have a Dog class in a dog.rb file, and some tests in dog_test.rb with the following code:

```ruby
require_relative 'dog'

class DogTest < MiniTest::Test
  def setup
    @spot = Dog.new('Spot')
  end

  def is_dog; end

  def name; end

  def bark; end

  def raises_error; end
end
```

Assuming all the methods are properly defined, which of the following actions must you do before your tests work?


A.  Add require `minitest/autorun` to the top of the file.

B.  Add require `minitest/reporters` to the top of the file.

C.  Append `_test` to the method names, e.g. change bark to `bark_test`.

D.  Prepend the method names with `test_`, e.g. change bark to `test_bark`.


### Question 9-14
This following set of questions relates to testing a custom Ruby class using MiniTest.

You define a Cat class in a cat.rb file:

```ruby
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def miaow
    "#{name} is miaowing."
  end
end
```

Next, you create a cat_test.rb file which contains the following CatTest class:

```ruby
class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_is_cat; end

  def test_name; end

  def test_miaow; end

  def test_raises_error; end
end
```


### Question 9 0 / 1 Points Incorrect
You want to test that calling the #name method on the @kitty instance will return the string 'Kitty'; which of the
following assertions would be the most appropriate to use in the body of the test_name test?


A.  `assert_equal('Kitty', @kitty.name)`

B.  `assert(@kitty.name == 'Kitty')`

C.  `assert(@kitty.name, 'Kitty')`

D.  `assert_equal(@kitty.name, 'Kitty')`


### Question 10
You want to test that calling the #miaow method on the @kitty instance will return the string containing' is miaowing.';
which of the following code snippets could you place in the body of the test_miaow test?


A.  `assert(@kitty.miaow.include?(' is miaowing.'))`

B.  `assert_includes(@kitty.miaow, ' is miaowing.')`

C.  `assert_equal(' is miaowing.', @kitty.miaow)`

D.  `assert_includes(' is miaowing.', @kitty.miaow)`


### Question 11
Finally, you want to test that calling Cat.new without an argument will raise an ArgumentError; which of the following code snippets could you place in the body of the test_raises_error test?


A.
```ruby
assert_raises do
  Cat.new
end
```
B.
```ruby
assert_raises(ArgumentError) do
  Cat.new("Milo")
end
```
C.
```ruby
assert_raises(ArgumentError) do
  Cat.new
end
```
D.
```ruby
assert(Cat.new == ArgumentError)
```


### Question 12
You update the initialize method of your Cat class to take a second argument and assign it to a @purr_factor instance variable.
You also add an equivalent attr_accessor.

Examine the following test:

```ruby
def test_is_not_purrier
  patch = Cat.new('Patch', 5)
  milo = Cat.new('Milo', 3)

  refute(patch.purr_factor > milo.purr_factor)
end
```

Would it pass or fail?

A.  Pass

B.  Fail

C.  Neither. It will report the test as an error.


### Question 13
When reading the output results for the tests, what would the following indicate:

CatTest .FS.

A.  One test succeeded, two didn't succeed, one wasn't run

B.  Two tests weren't run, one succeeded, one didn't succeed

C.  Two tests succeeded, one didn't succeed, one wasn't run

D.  None of the above


### Question 14
Looking at the details of a failed test, you see the following:

  1) Failure:
```
CatTest#test_name [minitest_test.rb:21]:
Expected: "Milo"
  Actual: "Kitty"
```

Which of the following implementations of test_name would produce this result output?

A.  `assert_equal(@kitty.name, 'Milo')`

B.  `assert_equal('Milo', @kitty.name)`

C.  `assert(@kitty.name == 'Milo')`

D.  `refute_equal('Kitty', @kitty.name)`


### Question 15
Which of the following statements are true when discussing 'code coverage' in relation to testing?


A.  If you have a test for every public method, your code coverage will always be 100%.

B.  Code coverage is a measure of how much of a program is tested by a test suite.

C.  Code coverage can be used as a metric to assess code quality.

D.  All projects should aim for 100% code coverage.


### Answers

1.   B
2.   B
3.   B, D
4.   A, C
5.   B, D
6.   B, D
7.   A
8.   A, D
9.   A
10.  A, B
11.  C
12.  B
13.  C
14.  B
15.  B, C


