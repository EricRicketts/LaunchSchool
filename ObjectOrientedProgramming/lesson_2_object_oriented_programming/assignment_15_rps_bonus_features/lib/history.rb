class History
  attr_accessor :report
  attr_reader :keys

  def initialize(keys)
    @keys = keys
    reset
  end

  def reset
    @report = []
  end

  def update(human, computer, winner)
    h = update_round_column
    hsh = update_remaining_columns(human, computer, winner)

    report.push(h.merge(hsh))
  end

  private

  def update_round_column
    report.empty? ? Hash[:round, 1] : Hash[:round, report.last[:round] + 1]
  end

  def update_remaining_columns(human, computer, winner)
    {
      human_move: human.move.to_s, computer_move: computer.move.to_s,
      winner: winner.empty? ? "Tie" : winner,
      human_tally: human.tally, computer_tally: computer.tally
    }
  end
end
