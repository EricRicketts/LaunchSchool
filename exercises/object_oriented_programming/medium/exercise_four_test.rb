require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFourTest < Minitest::Test
  class CircularQueue
    attr_reader :size

    def initialize(size)
      @size = size
      @queue = Array.new(size)
    end

    def dequeue

    end

    def enqueue(n)
      @queue = @queue.unshift(n).take(size)
    end
  end

  def test_enqueue_one_element
    queue = CircularQueue.new(3)
    queue.enqueue(1)
    expected = [1, nil, nil]
    results = queue.instance_variable_get("@queue")
    assert_equal(expected, results)
  end

  def test_enqueue_two_elements
    queue = CircularQueue.new(3)
    queue.enqueue(2)
    queue.enqueue(1)
    expected = [1, 2, nil]
    results = queue.instance_variable_get("@queue")
    assert_equal(expected, results)
  end

  def test_enqueue_three_elements
    queue = CircularQueue.new(3)
    queue.enqueue(3)
    queue.enqueue(2)
    queue.enqueue(1)
    expected = [1, 2, 3]
    results = queue.instance_variable_get("@queue")
    assert_equal(expected, results)
  end

  def test_enqueue_full_queue
    queue = CircularQueue.new(3)
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    queue.enqueue(4)
    expected = [4, 3, 2]
    results = queue.instance_variable_get("@queue")
    assert_equal(expected, results)
  end

  def test_final
    skip
    queue = CircularQueue.new(3)
    assert(queue.dequeue == nil)

    queue.enqueue(1)
    queue.enqueue(2)
    assert(queue.dequeue == 1)

    queue.enqueue(3)
    queue.enqueue(4)
    assert(queue.dequeue == 2)

    queue.enqueue(5)
    queue.enqueue(6)
    queue.enqueue(7)
    assert(queue.dequeue == 5)
    assert(queue.dequeue == 6)
    assert(queue.dequeue == 7)
    assert(queue.dequeue == nil)

    queue = CircularQueue.new(4)
    assert(queue.dequeue == nil)

    queue.enqueue(1)
    queue.enqueue(2)
    assert(queue.dequeue == 1)

    queue.enqueue(3)
    queue.enqueue(4)
    assert(queue.dequeue == 2)

    queue.enqueue(5)
    queue.enqueue(6)
    queue.enqueue(7)
    assert(queue.dequeue == 4)
    assert(queue.dequeue == 5)
    assert(queue.dequeue == 6)
    assert(queue.dequeue == 7)
    assert(queue.dequeue == nil)
  end
end