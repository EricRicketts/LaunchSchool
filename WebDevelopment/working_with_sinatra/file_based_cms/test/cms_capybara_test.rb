ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'rack_session_access/capybara'
require 'pry-byebug'
require_relative '../cms'

class CmsCapybaraTest < Minitest::Test
  attr_accessor :home_path

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def setup
    @home_path = '/'
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def test_home_path
    # skip
    visit home_path
    %w[about.txt changes.txt history.txt about.md].each do |text|
      assert_text(text, count: 1)
    end
  end

  def test_home_path_links
    # skip
    visit home_path
    %w[about.txt changes.txt history.txt].each.with_index do |fname, idx|
      page.find_link(fname).click
      expected = 'This is the ' << fname << ' file.'
      assert_text(expected, count: 1)
      visit home_path
    end
  end

  def test_invalid_route
    # skip
    fname = 'foo.txt'
    url = home_path + fname
    expected = "#{fname} does not exist."
    visit url

    assert_text(expected, count: 1)
    visit home_path
    refute_text(expected)
  end

  def test_process_markdown_files
    # skip
    fname = 'about.md'
    url = home_path << fname

    visit url
    assert_selector('h1', text: 'Ruby', count: 1)
    assert_selector('p', text: 'An elegant programming language.', count: 1)
  end
end
