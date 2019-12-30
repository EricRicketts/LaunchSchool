require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise7Test < Minitest::Test

  def bubble_sort!(array)
    loop do
      swapped = false
      1.upto(array.size - 1) do |index|
        if block_given?
          next if yield(array[index - 1], array[index])
        else
          next if array[index - 1] <= array[index]
        end
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true
      end

      break unless swapped
    end
    nil
  end

  def test_no_block
    expected = [3, 5]
    array = [5, 3]
    bubble_sort!(array)
    assert_equal(expected, array)
  end

  def test_reverse_sort
    expected = [7, 5, 3]
    array = [5, 3, 7]
    bubble_sort!(array) { |first, second| first >= second }
    assert_equal(expected, array)
  end

  def test_no_block_larger_array
    expected = [1, 2, 4, 6, 7]
    array = [6, 2, 7, 1, 4]
    bubble_sort!(array)
    assert_equal(expected, array)
  end

  def test_divmod_7
    expected = [14, 22, 12, 6, 27]
    array = [6, 12, 27, 22, 14]
    bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
    assert_equal(expected, array)
  end

  def test_no_block_strings
    expected = %w(Kim Pete Tyler alice bonnie rachel sue)
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort!(array)
    assert_equal(expected, array)
  end

  def test_downcase
    expected = %w(alice bonnie Kim Pete rachel sue Tyler)
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
    assert_equal(expected, array)
  end
end

class Exercise7TestFurtherExploration < Minitest::Test

  def bubble_sort_by!(array)
    loop do
      swapped = false
      1.upto(array.size - 1) do |index|
        if block_given?
          next if yield(array[index - 1]) <= yield(array[index])
        else
          next if array[index - 1] <= array[index]
        end
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true
      end

      break unless swapped
    end
    nil
  end

  def test_no_block_larger_array
    expected = [1, 2, 4, 6, 7]
    array = [6, 2, 7, 1, 4]
    bubble_sort_by!(array)
    assert_equal(expected, array)
  end

  def test_divmod_7
    expected = [14, 22, 12, 6, 27]
    array = [6, 12, 27, 22, 14]
    bubble_sort_by!(array) { |value| value % 7 }
    assert_equal(expected, array)
  end

  def test_no_block_strings
    expected = %w(Kim Pete Tyler alice bonnie rachel sue)
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort_by!(array)
    assert_equal(expected, array)
  end

  def test_downcase
    expected = %w(alice bonnie Kim Pete rachel sue Tyler)
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort_by!(array) { |value| value.downcase }
    assert_equal(expected, array)
  end
end