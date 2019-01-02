class Integer
  ENGLISH_TO_ROMAN_DIGITS = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX',
    10 => 'X', 40 => 'XL', 50 => 'L', 90 => 'XC',
    100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM',
    1000 => 'M'
  }
  FIVE = 5
  TEN = 10

  def to_roman
    digits = self.digits
    digits.each.with_index.inject('') do |roman, (digit, idx)|
      one, two, three, four, five, six, seven, eight, nine = (1..9).map { |n| n*TEN**idx }
      number = digit*TEN**idx

      case number
      when one, four, five, nine
        roman.prepend(ENGLISH_TO_ROMAN_DIGITS[number])
      when two, three
        roman.prepend(ENGLISH_TO_ROMAN_DIGITS[one]*digit)
      when six, seven, eight
        multiplier = digit - FIVE
        roman.prepend(ENGLISH_TO_ROMAN_DIGITS[five] + ENGLISH_TO_ROMAN_DIGITS[one]*multiplier)
      else
        roman
      end
    end
  end
end
