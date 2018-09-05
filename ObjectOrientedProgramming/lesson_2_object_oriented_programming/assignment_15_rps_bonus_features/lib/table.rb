class Table
  attr_reader :columns, :opt_for_size

  def initialize(headers, opt_for_size = "")
    @columns = headers
    @opt_for_size = opt_for_size
  end

  def output(data)
    header = format_header
    row_divider = make_row_divider(header)
    header << row_divider
    return header if data.empty?
    body = make_table_body(data, row_divider)
    header.concat(body)
  end

  private

  def format_header
    col_size = set_column_size
    columns.inject('') do |header, col|
        header.concat(col.center(col_size), "|")
    end.prepend("|") << "\n"
  end

  def set_column_size
    (columns + [opt_for_size]).max_by(&:length).length + 2
  end

  def make_row_divider(header)
    "-" * (header.length - 1) << "\n"
  end

  def make_table_body(data, row_divider)
    col_size = set_column_size
    data.inject('') do |body, row_data|
      body << row_data.inject('') do |row, row_el|
        row.concat(row_el.center(col_size), "|")
      end.prepend("|").concat("\n", row_divider)
    end
  end
  # def generate_column_sizings(header_strings)
  #   header_strings.map(&:size)
  # end

  # def generate_header_data(human, computer)
  #   headers = set_player_header_widths(human, computer)
  #   human_header, computer_header, winner_header = *headers

  #   [
  #     "| round |", human_header, computer_header, winner_header,
  #     " #{human.name} tally |", " #{computer.name} tally |"
  #   ]
  # end

  # def generate_row_separator(header_strings)
  #   col_sizings = generate_column_sizings(header_strings)
  #   ("-" * col_sizings.sum) << "\n"
  # end

  # def make_a_row(row_data, row_sizings, row_divider)
  #   row_data.values.each_with_index.inject('') do |row, (data, idx)|
  #     if idx.zero?
  #       row.concat("|", data.to_s.center(row_sizings[idx] - 2), "|")
  #     else
  #       row.concat(data.to_s.center(row_sizings[idx] - 1), "|")
  #     end
  #   end.concat("\n", row_divider)
  # end

  # def make_table_body(report, row_sizings, row_divider)
  #   report.inject('') do |table_body, row_data|
  #     table_body << make_a_row(row_data, row_sizings, row_divider)
  #   end
  # end

  # def make_table_header(header_strings, row_divider)
  #   header_strings.join << "\n" << row_divider
  # end

  # def set_column_width(human, computer)
  #   [human.name, computer.name, "scissors"].max_by(&:length).length + 2
  # end

  # def set_player_header_widths(human, computer)
  #   column_width = set_column_width(human, computer)

  #   [
  #     human.name.center(column_width) << "|",
  #     computer.name.center(column_width) << "|",
  #     "Winner".center(column_width) << "|"
  #   ]
  # end

  # def table_prep_work(human, computer)
  #   header_strings = generate_header_data(human, computer)
  #   [
  #     header_strings, generate_row_separator(header_strings),
  #     generate_column_sizings(header_strings)
  #   ]
  # end
end