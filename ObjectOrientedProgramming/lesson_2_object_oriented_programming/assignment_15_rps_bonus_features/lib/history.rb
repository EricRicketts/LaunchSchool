require 'pry-byebug'
class History

  COLUMN_HEADERS = [
    :round, :human_move, :computer_move, :winner,
    :human_tally, :computer_tally
  ]

  attr_accessor :report

  def initialize
    reset
  end

  def reset
    @report = []
  end

  def output(human, computer)
    header_strings = generate_header_data(human, computer)
    row_divider = generate_row_separator(header_strings)

    table_header = make_table_header(header_strings, row_divider)
    row_sizings = generate_column_sizings(header_strings)

    table_body = make_table_body(report, row_sizings, row_divider)

    table_header << table_body
  end

  def update(human, computer, winner)
    hsh1 = report.empty? ? Hash[:round, 1] : Hash[:round, report.last[:round] + 1]
    hsh2 = {
      human_move: human.move.to_s, computer_move: computer.move.to_s,
      winner: winner.include?('tie') ? "Tie" : winner,
      human_tally: human.tally, computer_tally: computer.tally
    }

    self.report.push(hsh1.merge(hsh2))
  end

  private

  def generate_column_sizings(header_strings)
    header_strings.map { |column_string| column_string.size }
  end

  def generate_header_data(human, computer)
    winner_header = winner_column_sizing(human, computer)
    cols = [
      "| round |", " #{human.name} |", " #{computer.name} |",
      "#{winner_header}", " #{human.name} tally |",
      " #{computer.name} tally |"
    ]
  end

  def generate_row_separator(header_strings)
    col_sizings = generate_column_sizings(header_strings)
    ("-" * col_sizings.sum) << "\n"
  end

  def make_table_body(report, row_sizings, row_divider)
    report.inject('') do |table_body, row_data|
      table_body << make_a_row(row_data, row_sizings, row_divider)
    end
  end

  def make_table_header(header_strings, row_divider)
    header_strings.join << "\n" << row_divider
  end

  def make_a_row(row_data, row_sizings, row_divider)
    row_data = row_data.values
    row_data.each_with_index.inject('') do |row, (data, idx)|
      if idx.zero?
        row << "|" << data.to_s.center(row_sizings[idx] - 2) << "|"
      else
        row << data.to_s.center(row_sizings[idx] - 1) << "|"
      end
    end << "\n" << row_divider
  end

  def winner_column_sizing(human, computer)
    larger_name_size = human.name.length >= computer.name.length ?
      human.name.length : computer.name.length

    larger_name_size += 2
    "Winner".center(larger_name_size) << "|"
  end
end
