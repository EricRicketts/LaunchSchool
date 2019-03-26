require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'pry-byebug'
require_relative '../todo_modular'

class SinatraTodosTest < Minitest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = TodoModular

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def test_root_redirect
    visit "/"
    assert_current_path("/lists")
  end

  def test_todos_within_list
    visit "/lists"
    assert_selector('main > ul#lists > li > a > p', count: 2, visible: true)
  end
end