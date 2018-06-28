require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/dealable.rb'
require_relative '../app/scoreable.rb'

class TestScoreable < Minitest::Test
  include Dealable
  include Scoreable

  def setup
    @deck = create_deck
  end

  def test_score_cards_no_aces
    result = total({"JS" => 10, "2H" => 2, "7D" => 7})
    assert_equal(19, result)
  end

  def test_score_with_ace_equal_eleven
    result = total({"4S" => 4, "5D" => 5, "AS" => 11})
    assert_equal(20, result)
  end

  def test_score_twenty_one_with_ace
    cards = {"KS" => 10, "AS" => 11}
    assert_equal(21, total(cards))
  end

  def test_score_with_two_aces_changing_value
    cards = {"4S" => 4, "3D" => 3, "AS" => 11}
    result = total(cards)
    assert_equal(18, result)
    cards.merge!({"AC" => 11})
    result = total(cards)
    assert_equal(19, result)
    assert_equal({"4S" => 4, "3D" => 3, "AS" => 1, "AC" => 11}, cards)
    cards.merge!({"5H" => 5})
    result = total(cards)
    assert_equal(14, result)
    assert_equal({"4S" => 4, "3D" => 3, "AS" => 1, "AC" => 1, "5H" => 5}, cards)
  end

  def test_score_with_all_aces
    cards = {"AC" => 11, "AD" => 11}
    result = total(cards)
    assert_equal(12, result)
    assert_equal({"AC" => 1, "AD" => 11}, cards)
    cards.merge!({"AH" => 11})
    result = total(cards)
    assert_equal(13, result)
    assert_equal({"AC" => 1, "AD" => 1, "AH" => 11}, cards)
    cards.merge!({"AS" => 11})
    result = total(cards)
    assert_equal(14, result)
    assert_equal({"AC" => 1, "AD" => 1, "AH" => 1, "AS" => 11}, cards)
  end

  def test_score_over_twenty_one_no_aces
    cards = {"JS" => 10, "5D" => 5, "7H" => 7}
    score = total(cards)
    assert(busted?(score) && 22 == score)
  end

  def test_score_over_twenty_one_with_aces
    cards = {"JS" => 10, "5D" => 5, "AH" => 11}
    score = total(cards)
    assert(16 == score && {"JS" => 10, "5D" => 5, "AH" => 1} == cards)
    cards.merge!({"8D" => 8})
    score = total(cards)
    assert(busted?(score) && 24 == score && {"JS" => 10, "5D" => 5, "AH" => 1, "8D" => 8} == cards)
  end

end
