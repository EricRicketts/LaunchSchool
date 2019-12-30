require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class LoopingTest < Minitest::Test

  def test_loop_same_as_while
    counter = 0
    ary = []
    loop do
      break if counter >= 0
      counter += 1
      ary.push(counter)
    end 
    assert_empty(ary)
    assert_equal(0, counter)
    while counter > 0
      counter += 1
      ary.push(counter)
    end
    assert_empty(ary)
    assert_equal(0, counter)
  end

  def test_loop_same_as_begin_end_until
    counter = 0
    ary = []
    loop do
      counter += 1
      ary.push(counter)
      break if counter >= 1
    end
    assert_equal([[1], 1], [ary, counter])
    counter = 0
    ary = []
    begin
      counter += 1
      ary.push(counter)
    end until counter > 0
    assert_equal([[1], 1], [ary, counter])
  end

  def test_loop_over_string
    str = ('a'..'z').to_a.join
    arr = []
    idx = 0
    loop do
      arr.push(str[idx])
      idx += 1
      break if idx >= str.size
    end
    assert_equal(('a'..'z').to_a, arr)
  end

  def test_loop_over_array
    colors = ['green', 'blue', 'purple', 'orange']
    counter = 0
    arr = []

    loop do
      break if counter == colors.size
      arr.push("I'm the color #{colors[counter]}!")
      counter += 1
    end

    expected = %W(I'm\sthe\scolor\sgreen! I'm\sthe\scolor\sblue!
      I'm\sthe\scolor\spurple! I'm\sthe\scolor\sorange!)

    assert_equal(expected, arr)
  end

  def test_loop_over_hash
    number_of_pets = {
      'dogs' => 2, 'cats' => 4, 'fish' => 1
    }

    pets = number_of_pets.keys
    counter = 0
    arr = []

    loop do
      break if counter >= number_of_pets.size
      pet = pets[counter]
      pet_number = number_of_pets[pet]
      arr.push("I have #{pet_number} #{pet}!")
      counter += 1
    end

    expected = %W(I\shave\s2\sdogs! I\shave\s4\scats! I\shave\s1\sfish!)

    assert_equal(expected, arr)
  end
  
end