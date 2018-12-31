class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    index = 0
    remaining_numbers = (2..limit).to_a
    until all_primes_remain?(remaining_numbers)
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

  def all_primes_remain?(remaining_numbers)
    remaining_numbers.each.with_index.all? do |divisor, idx|
      sliced = remaining_numbers.slice(idx..-1)
      sliced.all? do |n|
        quotient, remainder = n.divmod(divisor)
        (quotient == 1 && remainder.zero?) || (quotient >= 1 && remainder != 0)
      end
    end
  end
end
