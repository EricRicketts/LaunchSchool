require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFourTest < Minitest::Test
  attr_accessor :queue

  class CircularQueue
    attr_reader :max_size

    def initialize(max_size)
      @max_size = max_size
      @q = []
    end

    def dequeue
      @q.pop
    end

    def enqueue(n)
      @q = full? ? @q.unshift(n).take(max_size) : @q.unshift(n)
    end

    private

    def full?
      max_size == @q.size
    end
  end

  def setup
    @queue = CircularQueue.new(3)
  end

  def test_enqueue_one_element
    queue.enqueue(1)
    expected = [1]
    results = queue.instance_variable_get("@q")
    assert_equal(expected, results)
  end

  def test_enqueue_two_elements
    queue.enqueue(2)
    queue.enqueue(1)
    expected = [1, 2]
    results = queue.instance_variable_get("@q")
    assert_equal(expected, results)
  end

  def test_enqueue_three_elements
    queue.enqueue(3)
    queue.enqueue(2)
    queue.enqueue(1)
    expected = [1, 2, 3]
    results = queue.instance_variable_get("@q")
    assert_equal(expected, results)
  end

  def test_enqueue_full_queue
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    queue.enqueue(4)
    expected = [4, 3, 2]
    results = queue.instance_variable_get("@q")
    assert_equal(expected, results)
  end

  def test_dequeue_one_element_queue
    queue.enqueue(1)
    expected = [1, []]
    dq_result = queue.dequeue
    results = [dq_result, queue.instance_variable_get("@q")]
    assert_equal(expected, results)
  end

  def test_dequeue_full_queue
    queue.enqueue(3)
    queue.enqueue(2)
    queue.enqueue(1)
    expected = [3, [1, 2]]
    dq_result = queue.dequeue
    results = [dq_result, queue.instance_variable_get("@q")]
    assert_equal(expected, results)
  end

  def test_final
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