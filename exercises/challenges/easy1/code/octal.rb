class Octal
  BASE_EIGHT = 8
  LARGEST_DIGIT = 7

  def initialize(digit_str)
    @base_eight_digits = convert_to_digit_array(digit_str)
  end

  def to_decimal
    return 0 if base_eight_digits.any? { |digit| digit > LARGEST_DIGIT }
    base_eight_digits.each.with_index.inject(0) do |base_ten, (digit, exponent)|
      base_ten += digit*(BASE_EIGHT**exponent)
    end
  end

  private

  attr_reader :base_eight_digits

  def convert_to_digit_array(digit_str)
    digit_str.to_i.digits
  end
end