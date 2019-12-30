Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class SiginSignoutTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

  def test_signin_form_exists
    # skip
    url = '/users/signin'
    username_label = '<label for="username">Username:</label>'
    username_input = '<input type="text" name="username" id="username"'
    password_label = '<label for="password">Password:</label>'
    password_input = '<input type="text" name="password" id="password"'
    button = '<button type="submit">Sign In</button>'

    get url

    labels_and_inputs = [
      username_label, username_input, button,
      password_label, password_input
    ]
    assert_equal(200, last_response.status)
    labels_and_inputs.each do |label_or_input|
      assert_equal(1, last_response.body.scan(label_or_input).size)
    end
  end

  def test_valid_signin
    # skip
    flash_message = 'Welcome!'
    url = '/users/signin'
    signout_text = 'Signed in as admin.'
    username = 'admin'
    post(url, params = { username: '  admin  ', password: '  secret  '} )

    assert_equal(302, last_response.status)
    assert_equal(flash_message, session[:message])
    assert_equal(username, session[:username])

    get last_response.headers['Location']
    assert_equal(200, last_response.status)

    assert_equal(1, last_response.body.scan(signout_text).size)
    assert_match(/<input.*value="Sign Out"/, last_response.body)
  end

  def test_invalid_signin
    # skip
    flash_message = 'Invalid Credentials'
    username = 'Foo Bar'
    url = '/users/signin'
    post(url, params = { username: 'Foo Bar', password: 'secret' })

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, flash_message)
    assert_includes(last_response.body, username)
  end

  def test_signout
    # skip
    flash_message = 'You have been signed out.'
    url = '/users/signout'
    post url

    assert_equal(302, last_response.status)
    assert_equal(flash_message, session[:message])
    get "/"

    assert_equal(200, last_response.status)
    refute_includes('Signed in as admin.', last_response.body)
    refute_match(/<input.*value="Sign Out"/, last_response.body)
  end
end