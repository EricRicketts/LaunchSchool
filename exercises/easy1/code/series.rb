class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(n)
    raise ArgumentError if n > digits.length
    number_series = Array.new
    digits.chars.map(&:to_i).each_cons(n) { |p| number_series << p }
    number_series
  end

  private

  attr_reader :digits
end