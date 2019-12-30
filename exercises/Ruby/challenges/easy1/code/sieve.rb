class Sieve

  def initialize(limit)
    @limit = limit
  end

  def primes
    index = 0
    prior_numbers = []
    remaining_numbers = (2..limit).to_a

    until prior_numbers.size == remaining_numbers.size
      prior_numbers = remaining_numbers
      divisor = remaining_numbers[index]
      remaining_numbers = remaining_numbers.reject do |n|
        (n % divisor).zero? unless n == divisor
      end
      index += 1
    end

    remaining_numbers
  end

  private

  attr_accessor :limit
end
