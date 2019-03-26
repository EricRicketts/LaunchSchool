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

  def test_root_path_lists_exist
    visit "/"
    assert_selector('main > ul#lists > li', count: 2, visible: true)
  end
end