module Rules

  ROCK_GREATER = Proc.new { |other| [Lizard, Scissors].include?(other) }
  PAPER_GREATER = Proc.new { |other| [Rock, Spock].include?(other) }
  SCISSORS_GREATER = Proc.new { |other| [Lizard, Paper].include?(other) }
  LIZARD_GREATER = Proc.new { |other| [Spock, Paper].include?(other) }
  SPOCK_GREATER = Proc.new { |other| [Scissors, Rock].include?(other) }

  GREATER_THAN_RULES = {
    Rock => ROCK_GREATER, Paper => PAPER_GREATER, Scissors => SCISSORS_GREATER,
    Lizard => LIZARD_GREATER, Spock => SPOCK_GREATER
  }

  ROCK_LESSER = Proc.new { |other| [Spock, Paper].include?(other) }
  PAPER_LESSER = Proc.new { |other| [Scissors, Lizard].include?(other) }
  SCISSORS_LESSER = Proc.new { |other| [Rock, Spock].include?(other) }
  LIZARD_LESSER = Proc.new { |other| [Rock, Scissors].include?(other) }
  SPOCK_LESSER = Proc.new { |other| [Paper, Lizard].include?(other) }

  LESSER_THAN_RULES = {
    Rock => ROCK_LESSER, Paper => PAPER_LESSER, Scissors => SCISSORS_LESSER,
    Lizard => LIZARD_LESSER, Spock => SPOCK_LESSER
  }

  EQUAL_TO_RULES = {
    Rock => Proc.new { |other| other == Rock },
    Paper => Proc.new { |other| other == Paper },
    Scissors => Proc.new { |other| other == Scissors },
    Lizard => Proc.new { |other| other == Lizard },
    Spock => Proc.new { |other| other == Spock }
  }

end