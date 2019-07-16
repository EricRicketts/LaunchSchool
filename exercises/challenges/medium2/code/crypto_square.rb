class Crypto
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def ciphertext
    remove_spaces(transpose_text.join)
  end

  def normalize_ciphertext
    transpose_text.map(&:join).map { |str| remove_spaces(str) }.join(' ')
  end

  def normalize_plaintext
    str.gsub(/[^[:alnum:]]+/, '').downcase
  end

  def plaintext_segments
    normalize_plaintext.scan(/[[:alnum:]]{1,#{size}}/)
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  private

  def remove_spaces(str)
    str.gsub(/[[:space:]]+/, '')
  end

  def transpose_text
    text_segs = plaintext_segments
    text_segs[text_segs.length - 1] = text_segs.last.ljust(size)
    text_segs.map { |str| str.chars }.transpose
  end
end