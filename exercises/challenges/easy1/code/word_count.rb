class Phrase
  def initialize(str)
    @str = str
  end

  def word_count
    no_quotes = str.gsub(/\'([[:alnum:]]+)\'/, '\1')
    arr = no_quotes.scan(/[[[:alnum:]]\']+/).map(&:downcase)
    arr.map { |word| [word, arr.count(word)] }.to_h
  end

  private

  attr_reader :str
end