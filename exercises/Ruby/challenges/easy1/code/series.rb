class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(n)
    raise ArgumentError if n > digits.length
    digits.chars.map(&:to_i).each_cons(n).to_a
  end

  private

  attr_reader :digits
end