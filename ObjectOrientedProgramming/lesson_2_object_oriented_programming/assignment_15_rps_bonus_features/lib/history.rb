class History
  attr_accessor :report

  def initialize
    reset
  end

  def reset
    @report = []
  end

  def table(human, computer, winner)
    header_data = header(human, computer, winner)
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

  def header(human, computer, winner)
    larger_name_size = human.name.length >= computer.name.length ?
      human.name.length : computer.name.length
    larger_name_size += 2
    winner_header = "Winner".center(larger_name_size) + "|"
    titles = [
      "| round |", " #{human.name} |", " #{computer.name} |",
      "#{winner_header}", " #{human.name} tally |",
      " #{computer.name} tally |"
    ]
  end
end
