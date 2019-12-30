Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class SignUpTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

  def test_signup_form_exists
    # skip
    signup_form = '<form action="/users/signup" method="post">'
    button = '<button type="submit">Sign Up</button>'
    url = '/users/signup'
    get url

    assert_equal(200, last_response.status)
    assert_equal(1, last_response.body.scan(signup_form).size)
    assert_equal(1, last_response.body.scan(button).size)
  end

  def test_valid_signup
    # skip
    username = 'Elmer Fudd'
    signed_in_text = 'Signed in as Elmer Fudd.'
    flash_message = 'Congrats!! You now have an account.'
    url = '/users/signup'
    post(url, params = { username: username, password: 'dduF_remlE' })

    assert_equal(302, last_response.status)
    get last_response.headers['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, flash_message)
    assert_includes(last_response.body, signed_in_text)

    users_file = load_user_credentials
    assert users_file.key?(username)
    assert users_file[username]
  end

  def test_invalid_signup
    # skip
    username = '   '
    password = '2zXfz4'
    flash_message = 'A name and password is required.'
    url = '/users/signup'
    post(url, params = { username: username, password: password })

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, flash_message)
  end
end
