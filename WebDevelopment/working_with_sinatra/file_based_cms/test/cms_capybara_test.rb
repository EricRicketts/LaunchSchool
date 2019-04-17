ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require 'fileutils'
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
    @dir = data_path
    fnames.each { |fname| FileUtils.mkdir_p(data_path) }
    fnames.each do |fname|
      File.open(dir + "/#{fname}", "w+") do |f|
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
    FileUtils.rm_rf(data_path)
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def test_home_path
    # skip
    visit home_path
    all_files = fnames + %w[foo.txt foo.md]

    assert_link('Edit', count: 2)
    all_files.each do |text|
      assert_link(text, count: 1)
    end
    assert_link('New Document', count: 1)
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
    new_text = 'new text for foo.txt'
    flash_message = "#{fname} has been updated."
    visit home_path

    page.find_link('Edit', href: "/#{fname}/edit").click

    assert_includes(page.text, original_text)
    page.fill_in('file', with: new_text)
    page.find_button('Save Changes').click

    assert_current_path(home_path)
    assert_text(flash_message, count: 1)

    page.find_link(fname).click
    assert_text(new_text, count: 1)
    assert_no_text(flash_message)
  end

  def test_create_new_file
    # skip
    new_file_name = 'new_file.txt'
    flash_message = "#{new_file_name} was created."

    visit home_path
    page.find_link('New Document').click

    assert_selector('form', count: 1)
    assert_selector('label', text: 'Add a new document:', count: 1)

    page.fill_in('new', with: new_file_name)
    page.find_button('Create').click

    assert_text(flash_message, count: 1)
    assert_selector('a', text: new_file_name, count: 1)
  end

  def test_incorrect_new_file_entry
    # skip
    flash_message = 'A name is required.'
    visit home_path
    page.find_link('New Document').click

    page.fill_in('new', with: '   ')
    page.find_button('Create').click

    assert_text(flash_message, count: 1)
    assert_selector('form', count: 1)
  end
end
