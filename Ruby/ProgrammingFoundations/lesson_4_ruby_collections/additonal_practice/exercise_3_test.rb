require 'minitest/autorun'
require 'minitest/pride'

class  Exercise3Test < Minitest::Test
  def test_keep_younger
    ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
    expected = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }
    result = ages.delete_if { |key, value| value >= 100 }
    assert_equal expected, result
  end
end