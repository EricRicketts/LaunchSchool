require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/playable.rb'

class TestPlayable < Minitest::Test
  include Playable

  def setup
    @deck = create_deck
  end

  def test_deal_cards_to_contestants
    player_hand, dealer_hand = initialize_hands
    start_round(@deck, player_hand, dealer_hand)
    expected = [{ '2C' => 2, '4C' => 4 }, { '3C' => 3, '5C' => 5 }, 48]
    assert_equal(expected, [player_hand, dealer_hand, @deck.size])
  end

  def test_get_scores
    player_hand, dealer_hand = initialize_hands
    start_round(@deck, player_hand, dealer_hand)
    player_score, dealer_score = start_scoring(player_hand, dealer_hand)
    assert_equal([6, 8], [player_score, dealer_score])
  end

  def test_player_hit_no_bust
    player_hand = { '4C' => 4, '5D' => 5 }
    deck = { '8S' => 8, 'JD' => 10 }
    expected = [17, false]
    player_score, player_bust = player_hit(deck, player_hand)
    assert_equal(expected, [player_score, player_bust])
  end

  def test_player_hit_bust
    player_hand = { '4C' => 4, '10D' => 10 }
    deck = { '8S' => 8, 'JD' => 10 }
    expected = [22, true]
    player_score, player_bust = player_hit(deck, player_hand)
    assert_equal(expected, [player_score, player_bust])
  end

  def test_update_player_exit_player_quits
    assert(update_player_exit(:quit, false))
  end

  def test_update_player_exit_player_stays
    assert(update_player_exit(:stay, false))
  end

  def test_update_player_exit_player_busts
    assert(update_player_exit(:quit, true))
  end

  def test_update_player_exit_player_quits
    refute(update_player_exit(:hit, false))
  end

  def test_updat_dealer_exit_player_quits
    assert(update_dealer_exit(:quit))
  end

  def test_updat_dealer_exit_player_busts
    assert(update_dealer_exit(:hit, true))
  end

  def test_updat_dealer_exit_dealer_stays
    assert(update_dealer_exit(:hit, false, true))
  end

  def test_updat_dealer_exit_dealer_busts
    assert(update_dealer_exit(:hit, false, false, true))
  end

  def test_dealer_hit_dealer_stays
    deck = { "2H" => 2, "QD" => 10 }
    dealer_hand = { "KS" => 10, "7C" => 7}
    expected = [17, false, true]
    score, bust, stay = dealer_hit(deck, dealer_hand)
    assert_equal(expected, [score, bust, stay])
  end

  def test_dealer_hit_dealer_busts
    deck = { "2H" => 2, "QD" => 10 }
    dealer_hand = { "KS" => 10, "7C" => 7, "9D" => 9 }
    expected = [26, true, false]
    score, bust, stay = dealer_hit(deck, dealer_hand)
    assert_equal(expected, [score, bust, stay])
  end

  def test_dealer_hit_dealer_hits
    deck = { "2H" => 2, "QD" => 10 }
    dealer_hand = { "2S" => 2, "7C" => 7 }
    expected = [11, false, false]
    score, bust, stay = dealer_hit(deck, dealer_hand)
    assert_equal(expected, [score, bust, stay])
  end

end
