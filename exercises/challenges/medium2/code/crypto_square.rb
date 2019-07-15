class Crypto
  attr_reader :str
  def initialize(str)
    @str = str
  end

  def normalize_plaintext
    str.gsub(/[^[:alnum:]]+/, '').downcase
  end
end