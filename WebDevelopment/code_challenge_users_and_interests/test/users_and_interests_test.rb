require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'pry-byebug'

require_relative '../users_and_interests'

class Minitest::Test
  include Rack::Test::Methods
end

class UsersAndInterestsTest < Minitest::Test

  def get_list_items(str, regex)
    no_line_returns = str.gsub(/\n/, '')
    list_item_string = no_line_returns.match(regex)[0]
    list_item_string.scan(/<li>.*?<\/li>/)
  end

  def get_informational_paragraph(str)
    regex = /(?<=(<\/ol>|<\/ul>)).*?(?=<\/body>)/
    no_line_returns = str.gsub(/\n/, '')
    no_line_returns.match(regex)[0].strip
  end

  def app
    Sinatra::Application
  end

  def test_home_page_route
    # skip
    get "/"
    assert last_response.ok?
  end

  def test_home_page_links
    # skip
    get "/"
    list_items = get_list_items(last_response.body, /(?<=<ol>).*(?=<\/ol>)/)
    assert_equal(3, list_items.count)
  end

  def test_user_link
    # skip
    get "/jamy"
    list_items = get_list_items(last_response.body, /(?<=<ul>).*(?=<\/ul>)/)
    assert list_items.first.match(/email:\s/) && list_items.last.match(/interests:\s/)
  end

  def test_layout_home_page
    # skip
    get "/"
    paragraph = get_informational_paragraph(last_response.body)
    assert_equal "<p>There are 3 users with a total of 9 interests.</p>", paragraph
  end

  def test_layout_user_page
    # skip 
    get "/nora"
    paragraph = get_informational_paragraph(last_response.body)
    assert_equal "<p>There are 3 users with a total of 9 interests.</p>", paragraph
  end
end
