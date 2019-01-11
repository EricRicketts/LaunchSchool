class Luhn
  TEN = 10
  NINE = 9
  TWO = 2
  LAST_DIGIT = -1
  ZERO = 0

  attr_reader :number

  def self.create(number)
    new_luhn = new(number)
    new_luhn.valid? ? number : new_luhn.create
  end

  def initialize(number)
    @number = number
  end

  def addends(selector=:odd?)
    number.digits.map.with_index do |n, idx|
      idx.send(selector) ? reformat_digit(n) : n
    end.reverse
  end

  def checksum(selector=:odd?)
    addends(selector).sum
  end

  def create
    checksum < TEN ? add_digit(ZERO) : add_correction_digit
  end

  def valid?
    (checksum % TEN).zero?
  end

  private

  def add_digit(n)
    number.digits.unshift(n).reverse.join.to_i
  end

  def add_correction_digit
    shifted_checksum = checksum(:even?)
    correction_digit = shifted_checksum.ceil(LAST_DIGIT) - shifted_checksum
    add_digit(correction_digit)
  end

  def reformat_digit(n)
    TWO * n > NINE ? TWO * n - NINE : TWO * n
  end
end
