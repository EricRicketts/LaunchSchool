ENV['APP_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'rack_session_access/capybara'
require 'pry-byebug'
require_relative '../todo'

class SinatraTodosTest < Minitest::Test
  attr_accessor :new_list_path, :new_list_form, :new_list_button,
    :first_list_name, :home_path, :list_created, :first_list_link,
    :second_list_name, :list_name_error, :duplicate_list_error,
    :empty_string, :edit_list_link, :home_page_link_text, :list_updated,
    :list_header

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
    @list_created = 'The list has been created.'
    @first_list_link = 'ul#lists > li > a:first-of-type'
    @list_name_error = 'List name must be between 1 and 100 characters.'
    @duplicate_list_error = 'List name must be unique.'
    @empty_string = '   '
    @edit_list_link = 'section#todos > header > a'
    @home_page_link_text = 'All Lists'
    @list_updated = 'The list has been updated.'
    @list_header = 'section#todos > header > h2:first-of-type'
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def create_new_list(path, list_name)
    visit path
    complete_new_list_form(page, list_name)
  end

  def complete_new_list_form(page_obj, list_name)
    page_obj.find(new_list_form).set(list_name)
    page_obj.find(new_list_button).click
  end

  def test_add_new_list
    # skip
    create_new_list(new_list_path, first_list_name)
    assert_text(list_created, count: 1)
    list_data = page.get_rack_session_key('lists').first
    list_name, list_todos = list_data[:name], list_data[:todos].size.to_s

    visit home_path

    assert_no_text(list_created, count: 1)
    assert_equal(list_name, page.find('ul#lists > li > a > h2').text)
    assert_equal(list_todos, page.find('ul#lists > li > a > p').text)
    assert_text(first_list_name, count: 1)
  end

  def test_visit_a_list
    # skip
    create_new_list(new_list_path, first_list_name)
    page.find(first_list_link).click

    assert_equal(first_list_name, page.find(list_header).text)
    assert_text(home_page_link_text, count: 1)
  end

  def test_edit_a_list
    # skip
    create_new_list(new_list_path, first_list_name)
    assert_text(first_list_name, count: 1)

    page.find(first_list_link).click
    page.find(edit_list_link).click

    complete_new_list_form(page, second_list_name)
    assert_text(list_updated)
    assert_text(second_list_name, count: 1)
  end

  def test_spaces_only_for_new_list_name
    # skip
    create_new_list(new_list_path, empty_string)
    assert_text(list_name_error, count: 1)

    complete_new_list_form(page, first_list_name)
    assert_text(list_created, count: 1)
  end

  def test_spaces_only_for_edit_list_name
    # skip
    create_new_list(new_list_path, first_list_name)

    page.find(first_list_link).click
    page.find(edit_list_link).click

    complete_new_list_form(page, empty_string)
    assert_text(list_name_error, count: 1)

    complete_new_list_form(page, second_list_name)
    assert_text(second_list_name, count: 1)
  end

  def test_new_list_name_no_duplicates
    # skip
    create_new_list(new_list_path, first_list_name)
    page.find('div.actions > a[href="/lists/new"]').click

    complete_new_list_form(page, first_list_name)
    assert_text(duplicate_list_error, count: 1)

    complete_new_list_form(page, second_list_name)
    assert_text(list_created, count: 1)
  end

  def test_home_page
    # skip
    create_new_list(new_list_path, first_list_name)
    create_new_list(new_list_path, second_list_name)

    assert_current_path(home_path)
    assert_selector('ul#lists > li > a', count: 2)
    assert_text(first_list_name, count: 1)
    assert_text(second_list_name, count: 1)
    assert_link(href: '/lists/0')
    assert_link(href: '/lists/1')
  end
end
