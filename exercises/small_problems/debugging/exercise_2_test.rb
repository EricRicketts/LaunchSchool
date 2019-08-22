require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise2Test < Minitest::Test

  def shout_out_to(name)
    name.chars.each { |c| c.upcase! }
    'HEY ' + name
  end

  def shout_out_to_fix(name)
    'HEY ' + name.upcase
  end

  def test_wrong_result
    assert_equal('HEY you', shout_out_to('you'))
  end

  def test_fix
    assert_equal('HEY YOU', shout_out_to_fix('you'))
  end
end