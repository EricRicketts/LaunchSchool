class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  def self.to(limit)
    self.new(*DEFAULT_MULTIPLES).to(limit)
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    (1...limit).select { |n| is_a_multiple?(n) }.sum
  end

  private

  attr_reader :multiples

  def is_a_multiple?(n)
    multiples.any? { |divisor| (n % divisor).zero? }
  end
end
