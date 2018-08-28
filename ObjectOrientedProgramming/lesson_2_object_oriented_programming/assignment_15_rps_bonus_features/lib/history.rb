class History
  attr_accessor :report

  def initialize
    @report = reset
  end

  private

  def reset
    { round: 0,
      results: {
        human_move: '',
        computer_move: '',
        winner: '',
        human_tally: 0,
        computer_tally: 0
      }
    }
  end
end