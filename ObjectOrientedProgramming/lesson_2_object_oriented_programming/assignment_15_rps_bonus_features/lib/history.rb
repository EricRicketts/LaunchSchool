class History
  attr_accessor :report

  def initialize
    reset
  end

  def reset
    @report = []
  end

  def output(human, computer)
    header_strings, row_divider, row_sizings = table_prep_work(human, computer)

    table_header = make_table_header(header_strings, row_divider)
    table_body = make_table_body(report, row_sizings, row_divider)

    table_header << table_body
  end

  def update(human, computer, winner)
    hsh = if report.empty?
            Hash[:round, 1]
          else
            Hash[:round, report.last[:round] + 1]
          end

    hsh1 = {
      human_move: human.move.to_s, computer_move: computer.move.to_s,
      winner: winner.empty? ? "Tie" : winner,
      human_tally: human.tally, computer_tally: computer.tally
    }

    report.push(hsh.merge(hsh1))
  end

  private

  def generate_column_sizings(header_strings)
    header_strings.map(&:size)
  end

  def generate_header_data(human, computer)
    headers = set_player_header_widths(human, computer)
    human_header, computer_header, winner_header = *headers

    [
      "| round |", human_header, computer_header, winner_header,
      " #{human.name} tally |", " #{computer.name} tally |"
    ]
  end

  def generate_row_separator(header_strings)
    col_sizings = generate_column_sizings(header_strings)
    ("-" * col_sizings.sum) << "\n"
  end

  def make_a_row(row_data, row_sizings, row_divider)
    row_data = row_data.values

    row_data.each_with_index.inject('') do |row, (data, idx)|
      round_col = data.to_s.center(row_sizings[idx] - 2)
      other_cols = data.to_s.center(row_sizings[idx] - 1)
      idx.zero? ? row << "|" << round_col << "|" : row << other_cols << "|"
    end << "\n" << row_divider
  end

  def make_table_body(report, row_sizings, row_divider)
    report.inject('') do |table_body, row_data|
      table_body << make_a_row(row_data, row_sizings, row_divider)
    end
  end

  def make_table_header(header_strings, row_divider)
    header_strings.join << "\n" << row_divider
  end

  def set_column_width(human, computer)
    [human.name, computer.name, "scissors"].max_by(&:length).length + 2
  end

  def set_player_header_widths(human, computer)
    column_width = set_column_width(human, computer)

    [
      human.name.center(column_width) << "|",
      computer.name.center(column_width) << "|",
      "Winner".center(column_width) << "|"
    ]
  end

  def table_prep_work(human, computer)
    header_strings = generate_header_data(human, computer)
    [
      header_strings, generate_row_separator(header_strings),
      generate_column_sizings(header_strings)
    ]
  end
end
