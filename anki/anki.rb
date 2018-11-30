# require 'minitest/autorun'
# require 'minitest/pride'
require 'pry-byebug'

arr1 = %w(a b c)
arr2 = [[1, 2], ['a', 'b']]

def my_reduce(collection, accumulator=collection.first)
  size = collection.count
  count = 1

  while count < size
    accumulator = yield(accumulator, collection[count])
    count += 1
  end

  accumulator
end

puts (my_reduce(arr1) { |acc, value| acc += value } == 'abc')
puts (my_reduce(arr2) { |acc, value| acc + value } == [1, 2, 'a', 'b'])
