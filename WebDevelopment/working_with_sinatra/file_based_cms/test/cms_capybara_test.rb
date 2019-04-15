ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'rack_session_access/capybara'
require 'pry-byebug'
require_relative '../cms'

class CmsCapybaraTest < Minitest::Test
  attr_accessor :home_path, :dir, :fnames

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def setup
    @home_path = '/'
    @fnames = %w[foo.txt foo.md]
    path = File.expand_path(__FILE__)
    @dir = File.dirname(path).sub(/\/test/, "/data/")
    fnames.each do |fname|
      File.open(dir + fname, "w+") do |f|
        if fname == 'foo.txt'
          f.puts 'First line of foo.txt'
          f.puts 'This is the second line in foo.txt which is a text file.'
        else
          f.puts '# Foo'
          f.puts 'This is a paragraph in foo.md which is a markdown file.'
        end
      end
    end
  end

  def teardown
    fnames.each do |fname|
      File.delete(dir + fname) if File.exists?(dir + fname)
    end
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def test_home_path
    # skip
    visit home_path
    all_files = fnames + %w[about.md changes.txt history.txt]

    assert_text('Edit', count: 5)
    all_files.each do |text|
      assert_link(text, count: 1)
    end
  end

  def test_invalid_route
    # skip
    fname = 'bar_fizz_buzz.txt'
    url = home_path + fname
    expected = "#{fname} does not exist."
    visit url

    assert_text(expected, count: 1)
    visit home_path
    refute_text(expected)
  end

  def test_process_markdown_files
    # skip
    fname = fnames.last
    url = home_path + fname

    visit url
    assert_selector('h1', text: 'Foo', count: 1)
    assert_selector('p', text: 'This is a paragraph in foo.md which is a markdown file.', count: 1)
  end

  def test_edit_a_file
    # skip
    fname = fnames.first
    original_text = "First line of foo.txt This is the second line in foo.txt which is a text file."
    visit home_path

    page.find_link('Edit', href: "/#{fname}/edit").click

    assert_includes(page.text, original_text)
  end
end
