class PhoneNumber
  REGEX = /^(\d)?(\()?(\d{3})(?(2)\)\s)[.-]*(\d{3})[.-]*(\d{4,})$/

  def initialize(str)
    @str = str
  end

  def area_code
    number.match(/\d{3}/)[0]
  end

  def number
    m = str.match(REGEX)
    invalid_phone_number?(m) ? '0' * 10 : m[3] << m[4] << m[5]
  end

  def to_s
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  private

  attr_reader :str

  def invalid_phone_number?(m)
    m.nil? || m[5].size > 4 || (m[1] != "1" && !m[1].nil?)
  end
end
