class Element
  attr_reader :datum, :next

  def initialize(data, next_elem = nil)
    @datum = data
    @next = next_elem
  end

  def tail?
    !!datum
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def self.from_a(arr)
    if (arr.nil? || arr.empty?)
      SimpleLinkedList.new
    else
      list = SimpleLinkedList.new
      arr.reverse.each { |el| list.push(el) }
      list
    end
  end

  def initialize
    @head = nil
    @size = 0
  end

  def empty?
    size.zero?
  end

  def peek
    head.nil? ? nil : head.datum
  end

  def pop
    return nil if head.nil?
    data = head.datum
    @head = head.next
    @size -= 1
    data
  end

  def push(data)
    @head = head.nil? ? Element.new(data) : Element.new(data, @head)
    @size += 1
  end

  def reverse
    reversed_arr = to_a.reverse
    SimpleLinkedList.from_a(reversed_arr)
  end

  def to_a
    ary = []
    return ary if head.nil?
    until head.nil?
      ary << head.datum
      @head = head.next
    end
    ary
  end
end