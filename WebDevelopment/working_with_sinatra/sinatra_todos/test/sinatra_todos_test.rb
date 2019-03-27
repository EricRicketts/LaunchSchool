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
    form_selector = "form[action=\"/lists\"][method=\"post\"]"
    label_selector = "form > dl > dt > label[for=\"list_name\"]"
    input_selector = "form > dl > dd > input[type=\"text\"][name=\"list_name\"][value=\"\"]"
    submit_button = "form > fieldset > input[type=\"submit\"][value=\"Save\"]"
    form_link = "form > fieldset > a[href=\"/lists\"]"
    assert_selector(form_selector)
    assert_selector(label_selector)
    assert_selector(input_selector)
    assert_selector(submit_button)
    assert_selector(form_link)
    assert_text('Cancel', count: 1)
  end
end
