require 'pry-byebug'
class Crypto
  attr_reader :str
  def initialize(str)
    @str = str
  end

  def ciphertext
    transposed = transpose_text_array
    transposed.join.gsub(/[[:space:]]+/, '')
  end

  def normalize_ciphertext
    transpose_text_array.map(&:join).map { |str| str.gsub(/[[:space:]]+/, '') }.join(' ')
  end

  def normalize_plaintext
    str.gsub(/[^[:alnum:]]+/, '').downcase
  end

  def plaintext_segments
    normalize_plaintext.scan(/[[:alnum:]]{1,#{size}}/)
  end

  def size
    normalized_length = normalize_plaintext.length
    Math.sqrt(normalized_length).ceil
  end

  private

  def transpose_text_array
    text_segs = plaintext_segments
    text_segs[text_segs.length - 1] = text_segs.last.ljust(size)
    text_segs.map { |str| str.chars }.transpose
  end
end