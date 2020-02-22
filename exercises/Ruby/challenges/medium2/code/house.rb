class House
  PREFIX = 'This is '
  def self.recite
    phrases = House.new.pieces
    last_index = phrases.length - 1
    all_pieces = (0..last_index).reduce([]) { |new_piece, idx| new_piece.push(phrases.slice(idx,last_index + 1))}
    x = all_pieces.reduce([]) do |rhyme_arr, pieces_arr|
      rhyme_arr.prepend(House.new.compose_stanza(pieces_arr))
    end.join("\n")
    y = x.prepend(PREFIX)
    y
    # House.new.compose_stanza(phrases)
  end
  # (0..11).reduce([]) { |memo, idx| memo.push(phrases[idx..]) }
  def compose_stanza(phrases)
    last_idx = phrases.length - 1
    phrases.each.with_index.reduce('') do |stanza, (verse, idx)|
        normal_verse = verse.first + "\n" + verse.last + " "
        normal_verse.prepend(PREFIX) if idx.zero?
        last_verse = verse.first + "." + "\n"
        verse_str = idx == last_idx ? last_verse : normal_verse
      stanza += verse_str
      stanza
    end
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