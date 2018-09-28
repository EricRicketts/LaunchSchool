require_relative './player'
require_relative './dealer'
require_relative './rules'
require_relative './messaging'
require 'pry-byebug'

class TwentyOne
  include Rules
  include Messaging

  attr_accessor :player, :dealer

  def initialize
    welcome_message
    @dealer = Dealer.new
    @player = Player.new(get_player_name)
    @game_tally = { player: 0, dealer: 0 }
  end

  def play
    setup_game
    loop do
      start_game_message
      loop do
        start_round_message
        deal_cards
        show_cards
        current_tally_message
        player_turn
        dealer_turn unless busted?(player.cards)
        update_game_with_round_winner if no_busts?
        end_of_round_cleanup
        if game_winner?
          winner = get_game_winner
          game_winner_message(winner)
          break
        end
      end
      break unless play_again?
    end
    goodbye_message
  end

  private

  def busted_actions_for(participant)
    opponent = participant == :player ? :dealer : :player
    puts "#{send(participant).name} busts!!  #{send(opponent).name} wins the round!!"
    game_tally[opponent] += 1
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
    puts
    until busted?(dealer.cards) || dealer_stays?(dealer.cards)
      hit(dealer)
    end
    show_cards
    current_tally_message
    busted_actions_for(:dealer) if busted?(dealer.cards)
  end

  def end_of_round_cleanup
    round_cards = [player.cards, dealer.cards].flatten
    dealer.deck.take_back(round_cards)
    player.reset
    dealer.reset
    dealer.deck.shuffle
  end

  def get_player_name
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

  def get_round_winner_by_score
    if score(player.cards) > score(dealer.cards)
      :player
    elsif score(dealer.cards) > score(player.cards)
      :dealer
    else
      :draw
    end
  end

  def hit(participant)
    single_card = dealer.deck.deal(1)
    participant.cards.push(*single_card)
  end

  def no_busts?
    !busted?(player.cards) && !busted?(dealer.cards)
  end

  def play_again?
    puts
    answer = nil
    loop do
      puts "Would you like to play another game? (y/n)"
      answer = gets.strip.downcase.chomp[0]
      break if %w(y n).include?(answer)
      puts INCORRECT_ENTRY
    end
    answer == 'y'
  end

  def player_turn
    answer = ''
    loop do
      puts "Hit or Stay (h/hit or s/stay):"
      answer = gets.strip.downcase.chomp[0]
      unless %w(h s).include?(answer)
        puts "Sorry, incorrect input try again."
        redo
      end
      break puts "#{player.name} decides to stay!" if answer == 's'
      hit(player) if answer == 'h'
      show_cards
      current_tally_message
      break busted_actions_for(:player) if busted?(player.cards)
    end
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
    set_values(dealer.deck.cards)
    dealer.deck.shuffle
  end

  def show_cards
    puts "Dealer cards:"
    puts dealer.cards.map { |card| card.to_s }.join(' ')
    puts
    puts "Player cards:"
    puts player.cards.map { |card| card.to_s }.join(' ')
    puts
  end

  def show_scores
    player_score = score(player.cards)
    dealer_score = score(dealer.cards)
    puts "Scores are: #{player.name} #{player_score} #{dealer.name} #{dealer_score}"
  end

  def update_game_tally(round_winner)
    game_tally[round_winner] += 1 unless round_winner == :draw
  end

  def update_game_with_round_winner
    round_winner = get_round_winner_by_score
    update_game_tally(round_winner)
    show_scores
    round_winner_message(round_winner)
  end
end
