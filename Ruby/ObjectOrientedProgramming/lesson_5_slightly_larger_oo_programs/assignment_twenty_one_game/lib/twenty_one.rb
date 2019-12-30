require 'io/console'
require_relative './player'
require_relative './dealer'
require_relative './rules'
require_relative './messaging'
require_relative './ascii_cards'

class TwentyOne
  include Rules
  include Messaging
  include AsciiCards

  attr_accessor :player, :dealer, :quit_game

  def initialize
    puts welcome_message
    @dealer = Dealer.new
    @player = Player.new(obtain_player_name)
    @quit_game = false
    @game_tally = reset_tally
  end

  def play
    setup_game
    loop do
      start_game_message
      loop do
        play_round
        break if quit_game
        end_of_game_actions && break if game_winner?
      end
      break if quit_game
      play_again? ? system('clear') : break
    end
    goodbye_message
  end

  private

  def busted_actions_for(participant)
    opponent = participant == :player ? :dealer : :player
    participant_name = send(participant).name
    opponent_name = send(opponent).name
    puts "#{participant_name} busts!!  #{opponent_name} wins the round!!"
    game_tally[opponent] += 1
    participant == :player ? show_cards : show_cards(is_player_turn: false)
  end

  def continue_game
    puts "Press any key to continue ...."
    STDIN.getch
  end

  def current_tally_message
    player_tally = game_tally[:player]
    dealer_tally = game_tally[:dealer]
    puts "Current game tally: #{player.name} #{player_tally} "\
      "#{dealer.name} #{dealer_tally}"
  end

  def deal_cards
    four_cards = dealer.deck.deal(4)
    four_cards.each.with_index do |card, idx|
      idx.even? ? player.cards.push(card) : dealer.cards.push(card)
    end
  end

  def dealer_turn
    puts "It is now the dealer's turn"
    loop do
      break busted_actions_for(:dealer) if busted?(dealer.cards)
      break dealer_stay_actions if dealer_stays?(dealer.cards)
      puts "Dealer hits!!  Next dealer card coming up ..."
      hit(dealer)
      show_cards(is_player_turn: false)
      continue_game
    end
  end

  def dealer_stay_actions
    puts "The Dealer stays!!"
    show_cards(is_player_turn: false)
    continue_game
  end

  def declare_game_winner
    winner = determine_game_winner
    game_winner_message(send(winner).name)
  end

  def end_of_game_actions
    declare_game_winner
    reset_tally
  end

  def end_of_round_cleanup
    round_cards = [player.cards, dealer.cards].flatten
    dealer.deck.take_back(round_cards)
    player.reset
    dealer.reset
    dealer.deck.shuffle
    continue_game
  end

  def handle_quit_or_stay(answer)
    if answer == 'quit'
      self.quit_game = true
    else
      puts "#{player.name} decides to stay!"
      show_cards(is_player_turn: false)
    end
  end

  def hit(participant)
    single_card = dealer.deck.deal(1)
    participant.cards.push(*single_card)
  end

  def make_viewable_cards(cards)
    cards.map do |card|
      suit = card.to_s.chars.last
      rank = card.to_s.chars[0..-2].join
      make_ascii_card(rank, suit)
    end
  end

  def no_busts?
    !busted?(player.cards) && !busted?(dealer.cards)
  end

  def obtain_player_name
    name = ''
    loop do
      puts "Please enter your name."
      puts "At least two non-blank characters are required."
      name = gets.strip.chomp
      break if name.delete(' ').match?(/[[:alnum:]]{2,}/)
      puts INCORRECT_ENTRY
    end
    puts
    name
  end

  def obtain_round_winner_by_score
    if score(player.cards) > score(dealer.cards)
      :player
    elsif score(dealer.cards) > score(player.cards)
      :dealer
    else
      :draw
    end
  end

  def play_again?
    puts
    answer = nil
    loop do
      puts "Would you like to play another game? (yes/no)"
      answer = trim_input
      break if %w[yes no].include?(answer)
      puts INCORRECT_ENTRY
    end
    answer == 'yes'
  end

  def play_round
    system 'clear'
    start_round_message
    deal_cards
    show_cards
    current_tally_message
    player_turn
    return if quit_game
    dealer_turn unless busted?(player.cards)
    update_game_with_round_winner if no_busts?
    end_of_round_cleanup
  end

  def player_turn
    loop do
      puts "Hit, Stay or Quit game (hit, stay or quit):"
      answer = trim_input
      unless %w[hit stay quit].include?(answer)
        puts INCORRECT_ENTRY
        redo
      end
      break handle_quit_or_stay(answer) if %w[quit stay].include?(answer)
      if answer == 'hit'
        hit(player)
        break busted_actions_for(:player) if busted?(player.cards)
        show_cards
        continue_game
      end
    end
  end

  def reset_tally
    self.game_tally = { player: 0, dealer: 0 }
  end

  def round_winner_message(round_winner)
    if round_winner == :draw
      puts "The round ends in a draw!!"
    else
      puts "#{send(round_winner).name} wins the round!!"
    end
    current_tally_message
  end

  def setup_game
    give_values_to(dealer.deck.cards)
    dealer.deck.shuffle
  end

  def show_cards(is_player_turn: true)
    puts "Dealer cards:"
    dealer_cards = make_viewable_cards(dealer.cards)
    dealer_cards[0] = blank_card if is_player_turn
    display_cards(dealer_cards)
    puts
    puts "Player cards:"
    player_cards = make_viewable_cards(player.cards)
    display_cards(player_cards)
    puts
  end

  def show_scores
    player_score = score(player.cards)
    dealer_score = score(dealer.cards)
    puts "Scores are: #{player.name} #{player_score} "\
      "#{dealer.name} #{dealer_score}"
  end

  def trim_input
    gets.downcase.strip.chomp
  end

  def update_game_tally(round_winner)
    game_tally[round_winner] += 1 unless round_winner == :draw
  end

  def update_game_with_round_winner
    round_winner = obtain_round_winner_by_score
    update_game_tally(round_winner)
    show_scores
    round_winner_message(round_winner)
  end
end
