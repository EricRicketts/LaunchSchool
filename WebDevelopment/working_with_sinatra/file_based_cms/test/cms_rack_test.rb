ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'pry-byebug'
require_relative '../cms'

class CmsRackTest < Minitest::Test
  attr_reader :home_page, :dir, :fnames

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    @home_page = '/'
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
  end

  def test_home_page
    # skip
    get home_page
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response.headers['Content-Type'])
    links = last_response.body.scan(/<a href="\/[\w\.]+">[\w\.]+<\/a>/)
    assert_equal(5, links.size)
  end

  def test_text_file_content
    # skip
    url = home_page + fnames.first
    get url
    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response.headers['Content-Type'])
    expected = "First line of foo.txt\n" +
    "This is the second line in foo.txt which is a text file.\n"
    assert_equal(expected, last_response.body)
  end

  def test_invalid_route
    # skip
    filename = 'bar.txt'
    url = home_page + filename
    expected = "#{filename} does not exist."

    get url
    assert_equal(302, last_response.status)
    get last_response.headers['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, expected)

    get home_page
    refute_includes(last_response.body, expected)
  end

  def test_markdown_renders_to_html
    # skip
    url = home_page + fnames.last
    header = '<h1>Foo</h1>'
    paragraph = '<p>This is a paragraph in foo.md which is a markdown file.</p>'
    get url

    assert_equal(200, last_response.status)
    assert_equal('text/html; charset=utf-8', last_response.headers['Content-Type'])
    assert_includes(last_response.body, header)
    assert_includes(last_response.body, paragraph)
  end

  def test_edit_links_exist
    # skip
    url = home_page + fnames.first
    get home_page

    edit_links = [
      "<a href=\"/#{fnames.first}/edit\">Edit</a>",
      "<a href=\"/#{fnames.last}/edit\">Edit</a>"
    ]

    edit_links.each do |edit_link|
      assert_includes(last_response.body, edit_link)
    end
  end
end
