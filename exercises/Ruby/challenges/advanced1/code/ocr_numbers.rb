# frozen_string_literal: true

# OCR returns numeric string based on identifiable LED inputs
class OCR
  DIGIT_WIDTH = 3
  DIGIT_REGEXPS = {
    /^\s_\s?\n\|\s\|\n\|_\|\n$/ => '0',
    /^\s{3}?\n(\s{2}\|\n)\1$/ => '1',
    /^\s_\s?\n\s_\|\n\|_\s?\n$/ => '2',
    /^\s_\s?\n(\s_\|\n)\1$/ => '3',
    /^\s{3}?\n\|_\|\n\s{2}\|\n$/ => '4',
    /^\s_\s?\n\|_\s?\n\s_\|\n$/ => '5',
    /^\s_\s?\n\|_\s?\n\|_\|\n$/ => '6',
    /^\s_\s?\n(\s{2}\|\n)\1$/ => '7',
    /^\s_\s?\n(\|_\|\n)\1$/ => '8',
    /^\s_\s?\n\|_\|\n\s_\|\n$/ => '9'
  }.freeze

  attr_reader :text
  def initialize(text)
    @text = text
  end

  def convert
    rows = text.split(/\n{2}/)
    rows.length > 1 ? convert_multiple_rows(rows) : convert_row(rows.first)
  end

  def convert_multiple_rows(rows)
    rows.reduce([]) do |digits, row|
      digits.push(convert_row(row))
      digits
    end.join(',')
  end

  def convert_row(row)
    normalized_row = normalize_row(row.split(/\n/))
    grouped_row_indices = group_row_indices(normalized_row.first)
    digit_strings = make_digit_strings_from(grouped_row_indices, normalized_row)
    digit_strings.reduce('') do |digits, digit_str|
      digit_regex = DIGIT_REGEXPS.keys.find { |regex| digit_str.match?(regex) }
      digit = digit_regex.nil? ? '?' : DIGIT_REGEXPS[digit_regex]
      digits += digit
      digits
    end
  end

  def group_row_indices(row)
    row_indices = (0..row.length - 1).entries
    row_indices.each_slice(DIGIT_WIDTH).map do |arr|
      (arr.first..arr.last)
    end
  end

  def make_digit_strings_from(grouped_row_indices, normalized_rows)
    grouped_row_indices.each_with_object([]) do |index_range, digit_str_arr|
      digit_str = normalized_rows.reduce('') do |str, row|
        str += row[index_range] + "\n"
        str
      end
      digit_str_arr.push(digit_str)
    end
  end

  def normalize_row(rows)
    rows.map do |row|
      quotient, remainder = row.length.divmod(DIGIT_WIDTH)
      if quotient.zero? && remainder.zero?
        "\s" * DIGIT_WIDTH
      elsif !remainder.zero?
        row + "\s" * (DIGIT_WIDTH - remainder)
      else
        row
      end
    end
  end
end
