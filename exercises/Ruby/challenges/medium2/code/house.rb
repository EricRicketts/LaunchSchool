class House
  PREFIX = 'This is '
  def self.recite
    phrases = House.new.pieces
    last_index = phrases.length - 1
    all_stanzas = (0..last_index).reduce([]) do |phrase_arr, idx|
      phrase_arr.push(phrases[idx..])
      end
    rhyme = ''
    phrases.each.with_index.reduce('') do |rhyme, (fragments, idx)|
      normal_stanza = fragments.first + "\n" + fragments.last + ' '
      normal_stanza.prepend(PREFIX) if idx.zero?
      last_stanza = fragments.first + '.' + "\n"
      stanza = idx == last_index ? last_stanza : normal_stanza
      rhyme += stanza
      rhyme
    end
  end
  # (0..11).reduce([]) { |memo, idx| memo.push(phrases[idx..]) }

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