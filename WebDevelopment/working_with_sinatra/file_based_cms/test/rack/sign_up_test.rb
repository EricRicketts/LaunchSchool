Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class SignUpTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

  def test_signup_form
    # skip
    signup_form = '<form action="/users/signup" method="post">'
    button = '<button type="submit">Sign Up</button>'
    url = '/users/signup'
    get url

    assert_equal(200, last_response.status)
    assert_equal(1, last_response.body.scan(signup_form).size)
    assert_equal(1, last_response.body.scan(button).size)
  end
end
