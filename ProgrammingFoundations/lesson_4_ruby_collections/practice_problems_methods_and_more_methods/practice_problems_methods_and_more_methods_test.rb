require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class PracticeProblemsMethodsAndMoreMethodsTest < Minitest::Test

  def test_1
    # returns [1, 2, 3] because the return value for 'hi' is
    # truthy for each element in the array so each element in
    # the array is selected
    result = [1, 2, 3].select do |num|
      num > 5
      'hi'
    end
    assert_equal([1, 2, 3], result)
  end

  def test_2
    # according to the Ruby documentation, Array#count will count
    # the number of elements which pass the boolean condition
    result = ['ant', 'bat', 'caterpillar'].count do |word|
      word.length < 4
    end
    assert_equal(2, result)
  end

  def test_3
    # since the return value for #puts is nil and reject captures values
    # based on a falsy conditions each element of the array will be falsey
    # so the original array will be returned. The return value would be [1, 2, 3]
    result = []
    assert_output("1\n2\n3\n") { result = [1, 2, 3].reject {|num| puts num} }
    assert_equal([1, 2, 3], result)
  end

  def test_4
    # each_with_object will iterate through the array of strings and then populate
    # the empty hash that was passed to it.  This empty hash is the argument to
    # each_with_object and is in the block variable hash.  value is the string and
    # value[0] is the first letter of the string so the keys for the hash will be
    # the first letters of each string and the values will be the string associated
    # with the first letter
    result = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
      hash[value[0]] = value
    end
    expected = {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
    assert_equal(expected, result)
  end

  def test_5
    # looking at the documentation, Hash#shift returns a 2
    # element array consisting of the first key, value pair
    # in the hash.  Note for Ruby key/values are stored in
    # the order they are created.  Hash#shift mutates the
    # caller
    hash = {a: 'ant', b: 'bear'}
    assert_equal([:a, 'ant'], hash.shift)
    assert_equal({b: 'bear'}, hash)
  end

  def test_6
    # this was a bit tricky to understand at first, but one needs
    # to know what Array#pop returns, it does not return the array
    # though it does modify it.  Array#pop removes and returns the
    # last element in the array.  So in this case it returns the
    # string 'catepillar' then String#size is called on 'catepillar'
    # which has a length of 11.
    arr = %W(ant bear caterpillar)
    result = arr.pop.size
    assert_equal(11, result)      
  end

  def test_7
    # one can see Array#any? exits once a true value is found, the code below
    # the first two assertions better illustrates this.  In the call to Array#any?
    # below the blocks return value is true.  The block's return value is the last
    # line of code executed in the block, since 1 is odd num.odd? will return true
    # for the block.  The return value for Array#any? will be true because Array#any?
    # returns true if at least one block return value is not false or nil.  The output
    # will be "1\n" because the first odd number is 1, so it is output to STDOUT.
    # However, since 1.odd? is true, Array#any? will stop iterating. 
    result = false
    assert_output("1\n") {result = [1, 2, 3].any? {|num| puts num; num.odd?}}
    assert(result)
    count = 0
    [1, 2, 3].any? {|num| count +=1; num.odd?}
    assert_equal(1, count) # only increments count one time because 1.odd? is true, method exits
  end

  def test_8
    # Array#take is non-destructive, though I was not sure from the documentation that it was
    # it returns the first n elements of the array in an array.  If one is unsure of how the
    # method works according to the documentation then experiment with the method in irb.
    arr = (1..5).to_a
    assert_equal([1, 2], arr.take(2))
    assert_equal([1, 2, 3, 4, 5], arr)    
  end

  def test_9
    # Enumerable#map returns an array where each element is mapped according to the code
    # in the block associated with Enumerable#map.  The first time through value.size == 3
    # so the if conditional does not get evaluated so it returns nil.  The second time
    # through 'bear'.size > 3 to 'bear' is returned as the conditional is evaluated.
    result = { a: 'ant', b: 'bear' }.map do |key, value|
      if value.size > 3
        value
      end
    end
    expected = [nil, 'bear']
    assert_equal(expected, result)
  end

  def test_10
    # In this case the return value from the block associated with the Enumerable#map call
    # is going to be 1 for num = 1 and then nil for both num = 2 and num = 3.  This is because
    # puts prints to output and then returns nil.  The ternary statement sees 1 is not > 1,
    # so it takes the false branch and returns 1.  For both num = 2 and num = 3, the ternary
    # takes the true branch and executes puts num which outputs to STDOUT and then returns nil
    # which in both cases is the return value of the block.  Enumerable#map then appends these
    # return values onto an array.
    result = []
    assert_output("2\n3\n") { result = [1, 2, 3].map {|num| num > 1 ? (puts num) : num} }
    expected = [1, nil, nil]
    assert_equal(expected, result)   
  end

end