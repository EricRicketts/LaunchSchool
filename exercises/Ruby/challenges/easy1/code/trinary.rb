class Trinary
  BASE = 3

  def initialize(digit_str)
    @digit_ary = make_digit_ary(digit_str)
  end

  def to_decimal
    digit_ary.map.with_index { |digit, exp| digit*(BASE**exp) }.sum
  end

  private

  attr_reader :digit_ary

  def make_digit_ary(digit_str)
    digit_str.to_i.digits
  end
end