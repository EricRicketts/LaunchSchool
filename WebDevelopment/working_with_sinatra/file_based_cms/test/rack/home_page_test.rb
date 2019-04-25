Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class HomePageTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

  def test_home_page
    # skip
    get home_page
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response.headers['Content-Type'])
    links = last_response.body.scan(/(>#{fnames.first}|>#{fnames.last})/)
    new_document_link = last_response.body.scan(/New Document/)
    signin_link = last_response.body.scan(/Sign In/)
    signup_link = last_response.body.scan(/Sign Up/)
    edit_links = [
      "<a href=\"/#{fnames.first}/edit\">Edit</a>",
      "<a href=\"/#{fnames.last}/edit\">Edit</a>"
    ]

    assert_equal(2, links.size)
    assert_equal(1, new_document_link.size)
    assert_equal(1, signin_link.size)
    assert_equal(1, signup_link.size)

    assert_equal(edit_links.size, last_response.body.scan(/Edit/).size)
    edit_links.each do |edit_link|
      assert_includes(last_response.body, edit_link)
    end
  end

  def test_invalid_route
    # skip
    filename = 'bar.txt'
    url = home_page + filename
    expected = "#{filename} does not exist."

    get url
    assert_equal(302, last_response.status)
    assert_equal(expected, session[:message])
  end
end
