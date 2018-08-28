class History
  attr_reader :report

  def initialize
    reset
  end

  def reset
    @report = []
  end

  def update(human, computer, winner)
    hsh1, hsh2 = {}, {}
    hsh2[:results] = {
      human_move: human.move.to_s, computer_move: computer.move.to_s,
      winner: winner, human_tally: human.tally, computer_tally: computer.tally
    }
    report.empty? ? hsh1[:round] = 1 : hsh1[:round] += 1
    self.report.push(hsh1.merge(hsh2))
  end
end