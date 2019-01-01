class Anagram
  ALPHABETIZE_WORD = Proc.new do |w|
    w.downcase.chars.sort.join
  end

  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |str| anagram?(str) }
  end

  private

  attr_reader :word

  def anagram?(str)
    sorted_word, sorted_str = [word, str].map(&ALPHABETIZE_WORD)
    word.downcase != str.downcase && sorted_word == sorted_str
  end
end
