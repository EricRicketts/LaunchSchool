require_relative './player'
require_relative './dealer'
require_relative './rules'
require 'pry-byebug'

class TwentyOne
  INCORRECT_ENTRY = "Sorry, incorrect input try again."
  WINNING_TALLY = 10

  include Rules

  attr_accessor :player, :dealer, :game_tally

  def initialize
    welcome_message
    @dealer = Dealer.new
    @player = Player.new(get_player_name)
    @game_tally = {
      player: 0, dealer: 0
    }
  end

  def play
    setup_game
    loop do
      start_game_message
      loop do
        deal_cards
        show_cards
        player_turn
        dealer_turn unless busted?(player.cards)
        if no_busts?
          round_winner = get_round_winner_by_score
          update_game_tally(round_winner)
          round_winner_message(round_winner)
        end
        break if game_winner?
      end
      break
    end
  end

  private

  def busted_actions_for(participant)
    opponent = participant == :player ? :dealer : :player
    puts "#{send(participant).name} busts!!  #{send(opponent).name} wins!!"
    game_tally[opponent] += 1
    end_of_round_cleanup
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
    busted_actions_for(:dealer) if busted?(dealer.cards)
  end

  def end_of_round_cleanup
    round_cards = [player.cards, dealer.cards].flatten
    dealer.deck.take_back(round_cards)
    player.reset
    dealer.reset
    dealer.deck.shuffle
  end

  def game_winner?
    scores = [score(player.cards), score(dealer.cards)]
    scores.any? { |score| score >= WINNING_TALLY }
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
    if score(player.cards) > score(dealer.score)
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

  def start_game_message
    puts "Start the game!!"
  end

  def update_game_tally(round_winner)
    game_tally[round_winner] += 1 unless round_winner == :draw
  end

  def welcome_message
    puts "Welcome to the game of twenty-one!!"
    puts
    puts "A game winner is the player who is the first to win ten rounds."
    puts "A bust is a win for the player who did not bust."
    puts "Draws add nothing to the game tally for each player."
    puts
    puts "At the end of the game, the player has the option to continue or quit."
    puts "Game wins are not tracked, just round wins within the current game."
    puts
  end
end
