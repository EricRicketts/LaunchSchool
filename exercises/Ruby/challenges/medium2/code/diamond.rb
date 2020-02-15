# Diamond outputs a diamond shape to console consisting of spaces and letters
class Diamond
  LETTERS = ('A'..'Z').entries

  def self.make_diamond(last_letter)
    last_letter_index = LETTERS.index(last_letter)
    diamond = ''

    make_array_of_letter_indices(last_letter_index).each do |current_letter_index|
      diamond << make_diamond_row(last_letter_index, current_letter_index)
    end
    diamond
  end

  def self.make_array_of_letter_indices(last_letter_index)
    upper_half = 0.upto(last_letter_index - 1).entries
    center = [last_letter_index]
    lower_half = (last_letter_index - 1).downto(0).entries

    (upper_half + center + lower_half).chunk(&:itself).map(&:first)
  end

  def self.make_diamond_row(last_letter_index, current_letter_index)
    line_width = 2 * last_letter_index + 1
    last_index_in_row = line_width - 1
    row = ' ' * line_width

    first_letter_position = last_letter_index - current_letter_index
    second_letter_position = last_index_in_row - first_letter_position
    letter = LETTERS[current_letter_index]

    row[first_letter_position] = letter
    row[second_letter_position] = letter

    row + "\n"
  end

  private_class_method :make_array_of_letter_indices, :make_diamond_row
end
