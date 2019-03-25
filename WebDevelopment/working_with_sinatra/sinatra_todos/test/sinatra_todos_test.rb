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

  def test_root_path
    visit "/"
    assert_selector('main > p', text: 'You have no lists.', visible: true)
  end

  def test_root_path_another_way
    visit "/"
    assert_text(:visible, "You have no lists.", count: 1)
  end
end