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
  attr_reader :head

  def self.from_a(arr)
    arr.to_a.reverse.each.with_object(SimpleLinkedList.new) do |el, list|
      list.push(el)
    end
  end

  def initialize
    @head = nil
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
    data
  end

  def push(data)
    @head = Element.new(data, @head)
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  def size
    count = 0
    temp = head
    until temp.nil?
      count += 1
      temp = temp.next
    end
    count
  end

  def to_a
    ary = []
    temp = head
    size.times do
      ary << temp.datum
      temp = temp.next
    end
    ary
  end
end