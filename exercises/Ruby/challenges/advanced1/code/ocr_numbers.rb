# frozen_string_literal: true

# OCR returns numeric string based on identifiable LED inputs
class OCR
  OCR_TEXT_WIDTH = 3
  # These regexps form text based LED numbers 0 to 9
  OCR_REGEXPS = [
    /^\s_\s?\n\|\s\|\n\|_\|\n$/, /^\s{3}?\n(\s{2}\|\n)\1$/,
    /^\s_\s?\n\s_\|\n\|_\s?\n$/, /^\s_\s?\n(\s_\|\n)\1$/,
    /^\s{3}?\n\|_\|\n\s{2}\|\n$/, /^\s_\s?\n\|_\s?\n\s_\|\n$/,
    /^\s_\s?\n\|_\s?\n\|_\|\n$/, /^\s_\s?\n(\s{2}\|\n)\1$/,
    /^\s_\s?\n(\|_\|\n)\1$/, /^\s_\s?\n\|_\|\n\s_\|\n$/
  ].freeze

  attr_reader :text
  def initialize(text)
    @text = text
  end

  def convert
    text_rows = text.split(/\n{2}/)
    if text_rows.length > 1
      convert_multiple_rows(text_rows)
    else
      convert_row(text_rows.first)
    end
  end

  def convert_multiple_rows(rows)
    rows.each_with_object([]) do |row, digits|
      digits.push(convert_row(row))
      digits
    end.join(',')
  end

  def convert_ocr_strings_to_digits(ocr_strings)
    ocr_strings.reduce('') do |digits, ocr_str|
      ocr_regex_index = OCR_REGEXPS.find_index { |regex| ocr_str.match?(regex) }
      digit = ocr_regex_index.nil? ? '?' : ocr_regex_index.to_s
      digits += digit
      digits
    end
  end

  def convert_row(row)
    normalized_row = normalize_row(row.split(/\n/))
    grouped_row_indices = group_row_indices(normalized_row.first)

    ocr_strings = make_ocr_strings_from(grouped_row_indices, normalized_row)
    convert_ocr_strings_to_digits(ocr_strings)
  end

  def group_row_indices(row)
    row_indices = (0..row.length - 1).entries
    row_indices.each_slice(OCR_TEXT_WIDTH)&.map do |arr|
      (arr.first..arr.last)
    end
  end

  def make_ocr_strings_from(grouped_row_indices, normalized_rows)
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
      quotient, remainder = row.length.divmod(OCR_TEXT_WIDTH)
      if quotient.zero? && remainder.zero?
        "\s" * OCR_TEXT_WIDTH
      elsif !remainder.zero?
        row + "\s" * (OCR_TEXT_WIDTH - remainder)
      else
        row
      end
    end
  end
end
