class CircularBuffer
  BufferEmptyException = Class.new(IndexError)
  BufferFullException = Class.new(IndexError)
  attr_accessor :buffer

  def initialize(max_size)
    @max_size = max_size
    @buffer = Array.new.clear
  end

  def clear
    buffer.clear
  end

  def read
    buffer.empty? ? raise(BufferEmptyException) : buffer.shift
  end

  def write(val)
    full? ? raise(BufferFullException) : (buffer.push(val) unless val.nil?)
  end

  def write!(val)
    unless val.nil?
      buffer.shift if full?
      buffer.push(val)
    end
  end

  private

  attr_reader :max_size

  def full?
    buffer.size == max_size
  end
end