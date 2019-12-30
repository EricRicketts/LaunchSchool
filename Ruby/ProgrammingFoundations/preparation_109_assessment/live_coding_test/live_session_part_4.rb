require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
reverse an array w/o using reverse
AL:
  initialize an empty array
  - first index is -1
  - last index is -array.size
  - first.index downto last index
  push original_array[index] onto array
  return original_array
=end

class LiveSessionPart4ProblemOneSolutionOne < Minitest::Test

  def reverse(arr)
    reversed_arr = []
    last_index = -arr.size
    -1.downto(last_index) do |idx|
      reversed_arr.push(arr[idx])
    end
    reversed_arr
  end

  def test_1
    # skip
    assert_equal([4, 3, 2, 1], reverse([1, 2, 3, 4]))
  end

  def test_2
    # skip
    assert_equal([2], reverse([2]))      
  end

  def test_3
    # skip
    arr = %w(one two three four)
    assert_equal(["four", "three", "two", "one"], reverse(arr))       
  end

end

class LiveSessionPart4ProblemOneSolutionTwo < Minitest::Test

  def reverse(arr)
    last_index = arr.size - 1
    arr.map.with_index do |_, idx|
      arr[last_index - idx]
    end
  end

  def test_1
    # skip
    assert_equal([4, 3, 2, 1], reverse([1, 2, 3, 4]))
  end

  def test_2
    # skip
    assert_equal([2], reverse([2]))      
  end

  def test_3
    # skip
    arr = %w(one two three four)
    assert_equal(["four", "three", "two", "one"], reverse(arr))       
  end

end

=begin
"Write a program that prints the numbers from 1 to 100.
But for multiples of three print “Fizz” instead of the number
and for the multiples of five print “Buzz”. For numbers which
are multiples of both three and five print “FizzBuzz”."
do this for a passed in number
=end

class LiveSessionPart4ProblemTwo < Minitest::Test

  def fizzbuzz(number)
    (1..number).map do |num|
      case
      when (num % 15).zero? then "FizzBuzz"
      when (num % 3).zero? then "Fizz"
      when (num % 5).zero? then "Buzz"
      else num
      end
    end
  end

  def test_1
    expected = [
      1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz",
      "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17,
      "Fizz", 19, "Buzz" 
    ]
    assert_equal(expected, fizzbuzz(20))
  end
  
end

class LiveSessionPart4ProblemThree < Minitest::Test

=begin
I: a hash for search criteria
O: an array of hashes
AL:
  - we need to do a select on PRODUCT
    - take the price points of the query and make a range
    - set the query name to a variable, say vendor
    - now cycle through the PRODUCT array
      - we are guaranteed that the first string in the name
      is the product, so make this a downcase
      - select based on name == target && price in range?
=end

  PRODUCT = [
    { name: "Thinkpad x210", price: 220 },
    { name: "Thinkpad x220", price: 250 },
    { name: "Thinkpad x250", price: 979 },
    { name: "Thinkpad x230", price: 300 },
    { name: "Thinkpad x230", price: 330 },
    { name: "Thinkpad x230", price: 350 },
    { name: "Thinkpad x240", price: 700 },
    { name: "Macbook Leopard", price: 300 },
    { name: "Macbook Air", price: 700 },
    { name: "Macbook Pro", price: 600 },
    { name: "Macbook", price: 1449 },
    { name: "Dell Latitude", price: 200 },
    { name: "Dell Latitude", price: 650 },
    { name: "Dell Inspiron", price: 300 },
    { name: "Dell Inspiron", price: 450 }
  ]

  QUERY = {
    price_min: 240,
    price_max: 280,
    q: "thinkpad"
  }

  QUERY2 = {
    price_min: 300,
    price_max: 450,
    q: "dell"
  }

  def search(query)
    target_price_range = (query[:price_min]..query[:price_max])
    target_product_name = query[:q]
    PRODUCT.select do |hsh|
      current_product_name = hsh[:name].split.first.downcase
      current_product_price = hsh[:price]
      current_product_name == target_product_name &&
        target_price_range.include?(current_product_price)
    end
  end

  def test_1
    # skip
    expected = [ { name: "Thinkpad x220", price: 250} ]
    assert_equal(expected, search(QUERY))     
  end

  def test_2
    # skip
    expected = [
      { name: "Dell Inspiron", price: 300 },
      { name: "Dell Inspiron", price: 450 }
    ]
    assert_equal(expected, search(QUERY2))
  end 

  def test_3
    # skip
    query = {
      price_min: 200,
      price_max: 1500,
      q: "macbook"
    }
    expected = [
      { name: "Macbook Leopard", price: 300 },
      { name: "Macbook Air", price: 700 },
      { name: "Macbook Pro", price: 600 },
      { name: "Macbook", price: 1449 }      
    ]
    assert_equal(expected, search(query))
  end
  
end