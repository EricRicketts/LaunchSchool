class Table
  attr_reader :columns, :opt_for_size

  def initialize(headers, opt_for_size = "")
    @columns = headers
    @opt_for_size = opt_for_size
  end

  def output(data)
    header, row_divider = make_table_header
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

  def make_table_header
    header = format_header
    row_divider = make_row_divider(header)
    [header.concat(row_divider), row_divider]
  end

  def set_column_size
    (columns + [opt_for_size]).max_by(&:length).length + 2
  end
end
