ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'pry-byebug'
require_relative '../cms'

class CmsRackTest < Minitest::Test
  attr_reader :home_page

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    @home_page = '/'
  end

  def test_home_page
    # skip
    get home_page
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response.headers['Content-Type'])
    links = last_response.body.scan(/<a href.*?<\/a>/)
    assert_equal(4, links.size)
  end

  def test_home_page_links
    # skip
    %w[about.txt changes.txt history.txt].each do |fname|
      url = home_page + fname
      get url
      assert_equal(200, last_response.status)
      assert_equal('text/plain', last_response.headers['Content-Type'])
      assert_equal("This is the #{fname} file.", last_response.body)
    end
  end

  def test_invalid_route
    # skip
    filename = 'foo.txt'
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
    url = home_page << 'about.md'
    header = '<h1>Ruby</h1>'
    paragraph = '<p>An elegant programming language.</p>'
    get url

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, header)
    assert_includes(last_response.body, paragraph)
  end
end
