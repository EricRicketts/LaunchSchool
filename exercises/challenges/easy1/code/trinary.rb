class Trinary
  BASE = 3

  def initialize(digit_str)
    @digit_ary = make_digit_ary(digit_str)
  end

  def to_decimal
    digit_ary.each.with_index.inject(0) do |base_ten, (digit, exp)|
      base_ten += digit*(BASE**exp)
    end
  end

  private

  attr_reader :digit_ary

  def make_digit_ary(digit_str)
    digit_str.to_i.digits
  end
end