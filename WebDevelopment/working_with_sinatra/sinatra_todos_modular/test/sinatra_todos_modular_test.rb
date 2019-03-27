ENV['APP_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'rack_session_access/capybara'
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

  def test_lists_new
    # skip
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

  def test_add_new_list
    # skip 
    visit "/lists/new"
    page.find('form > dl > dd > input').set("First List")
    page.find('form > fieldset > input').click
    assert_text('The list has been created.', count: 1)
    list_data = page.get_rack_session_key('lists').first
    list_name, list_todos = list_data[:name], list_data[:todos].size.to_s
    visit "/lists"
    assert_no_text('The list has been created.')
    assert_equal(list_name, page.find('ul#lists > li > a > h2').text)
    assert_equal(list_todos, page.find('ul#lists > li > a > p').text)
  end
end
