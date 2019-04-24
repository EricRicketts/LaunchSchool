Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class SigninSignoutTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_valid_signin_and_signout
    # skip
    flash_message_one = 'Welcome!'
    flash_message_two = 'You have been signed out.'
    visit home_path

    page.find_button('Sign In').click

    page.fill_in('Username:', with: '  admin  ')
    page.fill_in('Password:', with: '  secret  ')
    page.find_button('Sign In').click

    assert_text(flash_message_one, count: 1)
    assert_current_path(home_path)
    assert_selector('label', text: 'Signed in as admin.')
    assert_no_button('Sign In')

    page.find('input[value="Sign Out"]').click
    assert_text(flash_message_two, count: 1)
    assert_button('Sign In')
    assert_no_selector('label', text: 'Signed in as admin.')
    assert_no_selector('input[value="Sign Out"]')
  end

  def test_invalid_signin
    # skip
    flash_message = 'Invalid Credentials'
    visit home_path

    page.find_button('Sign In').click

    page.fill_in('Username:', with: 'Foo Bar')
    page.fill_in('Password:', with: 'secret')
    page.find_button('Sign In').click

    assert_text(flash_message, count: 1)
    assert_equal('Foo Bar', page.find('input[name="username"]')['value'])
    assert_current_path('/users/signin')
  end
end