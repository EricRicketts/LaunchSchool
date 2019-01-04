class Scrabble
  LETTER_VALUES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    @word = word
  end

  def score
    word.to_s.upcase.scan(/[[:alpha:]]/).map do |letter|
      key = LETTER_VALUES.keys.select do |letters|
        letters.include?(letter)
      end.first
      LETTER_VALUES[key]
    end.sum
  end

  private

  attr_reader :word
end