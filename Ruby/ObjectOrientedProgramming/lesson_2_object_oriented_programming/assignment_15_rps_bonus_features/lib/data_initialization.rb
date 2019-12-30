module DataInitialization
  def set_header(human_name, computer_name)
    [
      "Round", human_name, computer_name, "Winner",
      human_name + " Tally", computer_name + " Tally"
    ]
  end

  def set_keys
    [
      :round, :human_move, :computer_move,
      :winner, :human_tally, :computer_tally
    ]
  end
end
