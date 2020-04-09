# frozen_string_literal: true

# OCR returns numeric string based on identifiable LED inputs
class OCR
  DIGIT_WIDTH = 3
  DIGIT_REGEXPS = {
    /\s_\s?\n\|\s\|\n\|_\|\n/ => '0',
    /\s{3}?\n(\s{2}\|\n)\1/ => '1',
    /\s_\s?\n\s_\|\n\|_\s?\n/ => '2',
    /\s_\s?\n(\s_\|\n)\1/ => '3',
  }.freeze

  attr_reader :text
  def initialize(text)
    @text = text
  end

  def convert
    rows = text.split("\n")
    normalized_rows = normalize_rows(rows)
    grouped_row_indices = group_row_indices(normalized_rows)
    digit_strings = make_digit_strings_from(grouped_row_indices, normalized_rows)
    digit_strings.reduce('') do |digits, digit_str|
      digit_regex = DIGIT_REGEXPS.keys.find { |regex| digit_str.match?(regex) }
      digits += DIGIT_REGEXPS[digit_regex]
      digits
    end
  end

  def group_row_indices(row)
    row_indices = row.each_index.entries
    row_indices.each_slice(DIGIT_WIDTH).map do |arr|
      (arr.first..arr.last)
    end
  end

  def make_digit_strings_from(grouped_row_indices, normalized_rows)
    grouped_row_indices.each_with_object([]) do |index_range, digit_str_arr|
      digit_str = index_range.entries.reduce('') do |str, index|
        str += normalized_rows[index] + "\n"
        str
      end
      digit_str_arr.push(digit_str)
    end
  end

  def normalize_rows(rows)
    rows.map do |row|
      remainder = row.length % DIGIT_WIDTH
      remainder.zero? ? row : row + "\s" * (DIGIT_WIDTH - remainder)
    end
  end
end
