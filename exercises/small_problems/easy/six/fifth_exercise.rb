require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FifthExercise < Minitest::Test

=begin
Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

Examples:

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b c d e)) == %w(e d c b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true

AL:
  - take [1, 2, 3, 4]
  - we can use an emtpy array => reversed_ary
  - negative indices are [-4, -3, -2, -1]
    -1.downto(-4) do |idx|
      reverse_ary.push(ary[idx])
    end
=end


  def reverse(ary)
    reversed_ary = []
    first_index = -ary.length
    -1.downto(first_index) do |idx|
      reversed_ary.push(ary[idx])
    end
    reversed_ary    
  end

  def test_1
    # skip
    list = (1..4).to_a
    result = reverse(list)
    assert_equal([4, 3, 2, 1], result)
    refute_equal(list.object_id, result.object_id)
  end

  def test_2
    # skip
    list = %w(a b c d e)
    result = reverse(list)
    assert_equal(%w(e d c b a), result)
    refute_equal(list.object_id, result.object_id)
  end

  def test_3
    # skip
    list = ['abc']
    result = reverse(list)
    assert_equal(['abc'], result)
    refute_equal(list.object_id, result.object_id)
  end

  def test_4
    # skip
    list = []
    result = reverse(list)
    assert_equal([], result)
    refute_equal(list.object_id, result.object_id)
  end

end

class FifthExerciseLS < Minitest::Test

=begin
I though the intent was to do something manually,
when I see LS use a unique method like this it's
a good sign for an Anki card
=end

  def reverse(ary)
    reversed_ary = []
    ary.reverse_each {|elem| reversed_ary.push(elem)}
    reversed_ary
  end
  
  def test_1
    # skip
    list = (1..4).to_a
    result = reverse(list)
    assert_equal([4, 3, 2, 1], result)
    refute_equal(list.object_id, result.object_id)
  end

  def test_2
    # skip
    list = %w(a b c d e)
    result = reverse(list)
    assert_equal(%w(e d c b a), result)
    refute_equal(list.object_id, result.object_id)
  end

  def test_3
    # skip
    list = ['abc']
    result = reverse(list)
    assert_equal(['abc'], result)
    refute_equal(list.object_id, result.object_id)
  end

  def test_4
    # skip
    list = []
    result = reverse(list)
    assert_equal([], result)
    refute_equal(list.object_id, result.object_id)
  end

end

