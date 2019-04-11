ENV['APP_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'rack_session_access/capybara'
require 'pry-byebug'
require_relative '../cms'

class CmsTest < Minitest::Test
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
    visit home_path
    %w[about.txt changes.txt history.txt].each do |text|
      assert_text(text, count: 1)
    end
  end

  def test_home_path_links
    visit home_path
    %w[about.txt changes.txt history.txt].each.with_index do |fname, idx|
      page.find_link(fname).click
      expected = 'This is the ' << fname << ' file.'
      assert_text(expected, count: 1)
      visit home_path
    end
  end
end