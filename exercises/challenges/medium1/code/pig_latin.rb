class PigLatin
  CONSONANT = /[bcdfghjklmnpqrstvwxyz]/
  VOWEL = /[aeiou]/
  LEAD_CONSONANTS = /\A(#{CONSONANT}*)(#{VOWEL}[[:alpha:]]+)\Z/
  LEAD_QU = /\A(#{CONSONANT}?qu)([[:alpha:]]+)\Z/
  LEAD_Y_OR_X = /\A(y|x)#{CONSONANT}[[:alpha:]]+\Z/
  SUFFIX = "ay"
  PIG_LATIN = lambda { |first, second| second.concat(first, SUFFIX) }

  def self.translate(str)
    str.scan(/[[:alpha:]]+/).map do |word|
      case word
      when LEAD_Y_OR_X then word << SUFFIX
      when LEAD_QU then PIG_LATIN.call($1, $2)
      else word.gsub(LEAD_CONSONANTS) { PIG_LATIN.call($1, $2) }
      end
    end.join(' ')
  end
end
