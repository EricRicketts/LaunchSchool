ENV['APP_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'rack_session_access/capybara'
require 'pry-byebug'
require_relative '../todo'

class SinatraTodosTest < Minitest::Test
  attr_accessor :new_list_path, :new_list_form, :new_list_button,
    :first_list_name, :home_path, :list_created_text, :first_list_link,
    :second_list_name, :list_name_error

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def setup
    @new_list_path = '/lists/new'
    @new_list_form = 'form > dl > dd > input'
    @new_list_button = 'form > fieldset > input'
    @first_list_name = 'First List'
    @second_list_name = 'Second List'
    @home_path = '/lists'
    @list_created_text = 'The list has been created.'
    @first_list_link = 'ul#lists > li > a:first-of-type'
    @list_name_error = 'List name must be between 1 and 100 characters.'
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def create_new_list(path, list_name)
    visit path
    page.find(new_list_form).set(list_name)
    page.find(new_list_button).click
  end

  def test_lists_new_form
    skip
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
    create_new_list(new_list_path, first_list_name)
    assert_text(list_created_text, count: 1)
    list_data = page.get_rack_session_key('lists').first
    list_name, list_todos = list_data[:name], list_data[:todos].size.to_s

    visit home_path

    assert_no_text(list_created_text, count: 1)
    assert_equal(list_name, page.find('ul#lists > li > a > h2').text)
    assert_equal(list_todos, page.find('ul#lists > li > a > p').text)
    assert_text(first_list_name, count: 1)
  end

  def test_visit_a_list
    # skip
    create_new_list(new_list_path, first_list_name)
    page.find(first_list_link).click
    assert_selector('section#todos > header > h2:first-of-type')
    assert_equal(first_list_name, page.find('section#todos > header > h2:first-of-type').text)
    assert_text("All Lists", count: 1)
  end

  def test_edit_a_list
    # skip
    create_new_list(new_list_path, first_list_name)
    assert_text(first_list_name, count: 1)
    page.find(first_list_link).click
    page.find('section#todos > header > a').click
    page.find(new_list_form).set(second_list_name)
    page.find('form > fieldset > input').click
    assert_text('The list has been updated.')
    assert_text(second_list_name, count: 1)
  end

  def test_spaces_only_for_new_list_name
    # skip
    create_new_list(new_list_path, '   ')
    assert_text(list_name_error, count: 1)
    page.find(new_list_form).set(first_list_name)
    page.find('form > fieldset > input').click
    assert_text(list_created_text, count: 1)
  end

  def test_spaces_only_for_edit_list_name
    # skip
    create_new_list(new_list_path, first_list_name)
    page.find(first_list_link).click
    page.find('section#todos > header > a').click
    page.find(new_list_form).set("    ")
    page.find('form > fieldset > input').click
    assert_text(list_name_error, count: 1)
    page.find(new_list_form).set(second_list_name)
    page.find('form > fieldset > input').click
    assert_text('Second List', count: 1)
  end

  def test_new_list_name_no_duplicates
    # skip
    create_new_list(new_list_path, first_list_name)
    page.find('div.actions > a[href="/lists/new"]').click
    page.find(new_list_form).set(first_list_name)
    page.find('form > fieldset > input').click
    assert_text('List name must be unique.', count: 1)
    page.find(new_list_form).set(second_list_name)
    page.find('form > fieldset > input').click
    assert_text(list_created_text, count: 1)
  end
end
