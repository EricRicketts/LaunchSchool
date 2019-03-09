class Prime

  def self.nth(n)
    raise ArgumentError if n < 1
    primes = [2]
    next_number = primes.last + 1

    while primes.length < n
      primes.push(next_number) unless primes.find { |p| (next_number % p).zero? }
      next_number += 1
    end

    primes.last
  end
end
