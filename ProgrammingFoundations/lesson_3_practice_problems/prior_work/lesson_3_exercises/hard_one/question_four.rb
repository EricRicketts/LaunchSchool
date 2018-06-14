require 'minitest/autorun'
require 'minitest/pride'

class QuestionFour < Minitest::Test
  def setup
    def create_uuid
      ary = ('a'..'z').to_a + (1..9).to_a
      num_ary = [8, 4, 4, 4, 12]
      num_ary.map { |n| ary.sample(n).join }.join("-")
    end
  end

  def test_uuid
    uuid = create_uuid
    ary_uuid = uuid.split("-")

    assert_equal 36, uuid.length
    assert_equal 4, uuid.count("-")
    assert_equal 8, ary_uuid.first.length
    assert_equal 12, ary_uuid.last.length
  end
end