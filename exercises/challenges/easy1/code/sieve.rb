class Sieve
  def initialize(limit)
    @remaining_numbers = (2..limit)
  end

  def primes
    index = 0
    until 
      binding.pry
      divisor = remaining_numbers[index]
      remaining_numbers = remaining_numbers.reject do |n|
        (n % divisor).zero? unless n == divisor
      end
      index += 1
    end 
  end

  private

  attr_accessor :remaining_numbers

  def all_primes_remain?
    primes = remaining_numbers.select
  end
end