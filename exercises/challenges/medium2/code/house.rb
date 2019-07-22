require 'pry-byebug'

class House
  FIRST_PHRASE_PREFIX = 'This is '

  def self.recite
    House.new.recite
  end

  def recite
    pieces.reverse.each_index.inject('') do |rhyme, idx|
      binding.pry
      slice = pieces.reverse.slice(0, idx + 1).reverse
      rhyme = gen_rhyme(rhyme, slice)
    end
  end

  private

  def gen_rhyme(rhyme, slice)
    slice.each.with_index.inject(rhyme) do |rhyme, (arr, idx)|
      binding.pry
      rhyme << (idx.zero? ? gen_1st_phr(rhyme, arr) : gen_other_phrs(rhyme, arr))
    end
  end

  def gen_1st_phr(rhyme, arr)
    rhyme << FIRST_PHRASE_PREFIX << arr.first << ".\n"
  end

  def gen_other_phrs(rhyme, arr)
    rhyme
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end