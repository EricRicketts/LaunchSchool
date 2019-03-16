class Palindrome
  attr_accessor :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

class Palindromes

  def initialize(max_factor: 1, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    self.palindromes = (min_factor..max_factor).to_a.repeated_combination(2).select do |n1, n2|
      (n1*n2).digits == (n1*n2).digits.reverse
    end.sort_by { |n1, n2| n1*n2 }.map { |n1, n2| { n1*n2 => [n1, n2].sort } }.uniq
  end

  def largest
    max_value = palindromes.last.keys.first
    Palindrome.new(max_value, generate_values(max_value))
  end

  def smallest
    min_value = palindromes.first.keys.first
    Palindrome.new(min_value, generate_values(min_value))
  end

  private

  attr_reader :min_factor, :max_factor
  attr_accessor :palindromes

  def generate_values(value)
    palindromes.select { |h| h.keys.first == value }.map do |h|
      h.values.first
    end
  end
end
