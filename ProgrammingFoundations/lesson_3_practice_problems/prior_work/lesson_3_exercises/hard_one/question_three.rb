require 'minitest/autorun'
require 'minitest/pride'

class QuestionThree < Minitest::Test
  def setup
    @one = "one"
    @two = "two"
    @three = "three"

    def mess_with_vars1(one, two, three)
      one = one
      two = two
      three = three
    end

    def mess_with_vars2(one, two, three)
      one = "two"
      two = "three"
      three = "one"
    end

    def mess_with_vars3(one, two, three)
      one.gsub!("one", "two")
      two.gsub!("two", "three")
      three.gsub!("three", "one")
    end
  end

  def test_version_one
    mess_with_vars1(@one, @two, @three)
    assert_equal "one", @one
    assert_equal "two", @two
    assert_equal "three", @three
  end

  def test_version_two
    mess_with_vars2(@one, @two, @three)
    assert_equal "one", @one
    assert_equal "two", @two
    assert_equal "three", @three
  end

  def test_version_three
    mess_with_vars3(@one, @two, @three)
    assert_equal "two", @one
    assert_equal "three", @two
    assert_equal "one", @three
  end
end