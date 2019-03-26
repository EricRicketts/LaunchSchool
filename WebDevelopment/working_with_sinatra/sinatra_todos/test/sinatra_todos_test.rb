require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'pry-byebug'
require_relative '../todo'

class SinatraTodosTest < Minitest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def test_lists_new
    visit "/lists/new"
    assert_equal("/lists", page.find('form')[:action])
  end
end
