Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class SignUpTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_valid_signup
    # skip
    signed_in_text = 'Signed in as Elmer Fudd.'
    flash_message = 'Congrats!! You now have an account.'
    visit home_path

    page.find_button('Sign Up').click
    page.fill_in('Username:', with: 'Elmer Fudd')
    page.fill_in('Password:', with: 'dduF_remlE')
    page.find_button('Sign Up').click

    assert_current_path(home_path)
    assert_text(flash_message, count: 1)
    assert_text(signed_in_text, count: 1)
  end
end
