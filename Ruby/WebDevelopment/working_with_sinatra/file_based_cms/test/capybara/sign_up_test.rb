Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class SignUpTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_valid_signup
    # skip
    username = 'Elmer Fudd'
    signed_in_text = "Signed in as #{username}."
    flash_message = 'Congrats!! You now have an account.'
    visit home_path

    page.find_button('Sign Up').click
    page.fill_in('Username:', with: username)
    page.fill_in('Password:', with: 'dduF_remlE')
    page.find_button('Sign Up').click

    assert_current_path(home_path)
    assert_text(flash_message, count: 1)
    assert_text(signed_in_text, count: 1)

    users_file = load_user_credentials
    assert users_file.key?(username)
    assert users_file[username]
  end

  def test_invalid_signup
    # skip
    signup_path = '/users/signup'
    username = '   '
    password = '2zXfz4'
    flash_message = 'A name and password is required.'
    visit home_path

    page.find_button('Sign Up').click
    page.fill_in('Username:', with: username)
    page.fill_in('Password:', with: password)
    page.find_button('Sign Up').click

    assert_text(flash_message, count: 1)
    assert_current_path(signup_path)
  end
end
