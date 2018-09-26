require_relative './player'
require_relative './dealer'
require_relative './rules'
require 'pry-byebug'

class TwentyOne
  include Rules

  attr_accessor :player, :dealer

  def initialize
    welcome_message
    @dealer = Dealer.new
    @player = Player.new(get_player_name)
  end

  def play
    loop do
      setup_game
      loop do
        deal_cards
        show_cards
        break
      end
      break
    end
  end

  private

  def deal_cards
    four_cards = dealer.deck.deal(4)
    four_cards.each.with_index do |card, idx|
      idx.even? ? player.cards.push(card) : dealer.cards.push(card)
    end
  end

  def get_player_name
    name = ''
    loop do
      puts "Please enter your name."
      puts "At least two non-blank characters are required."
      name = gets.strip.chomp
      break if name.delete(' ').match?(/[[:alnum:]]{2,}/)
      puts "Sorry, incorrect input try again."
    end
    puts
    name
  end

  def setup_game
    set_values(dealer.deck.cards)
    dealer.deck.shuffle
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
