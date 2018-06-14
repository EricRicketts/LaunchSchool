require 'minitest/autorun'
require 'minitest/pride'

# Alyssa was asked to write an implementation of a rolling buffer. Elements are added
# to the rolling buffer and if the buffer becomes full, then new elements that are added
# will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying
# the buffer?". Is there a difference between the two, other than what operator she chose
# to use to add an element to the buffer?

# the difference between the two is that #rolling_buffer1 mutates the incoming array,
# while #rolling_buffer2 does not, I like #rolling_buffer2 better because it adheres
# to the single responsibility principle, it takes an incoming array and an element
# and returns a new array without modifying the incoming array.  In the first case a
# new array is returned along with mutating the original array.

class QuestionSix < Minitest::Test
  def rolling_buffer1(buffer, max_buffer_size, new_element)
    buffer << new_element
    buffer.shift if buffers.size >= max_buffer_size
    buffer
  end

  def rolling_buffer2(input_array, max_buffer_size, new_element)
    buffer = input_array + [new_element]
    buffer.shift if buffers.size >= max_buffer_size
    buffer
  end

end
