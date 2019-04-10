ENV['APP_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'rack_session_access/capybara'
require 'pry-byebug'
require_relative '../cms'

class CmsTest < Minitest::Test

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def test_home_path
    visit "/"
    %w[about.txt changes.txt history.txt].each do |text|
      assert_text(text, count: 1)
    end
  end
end