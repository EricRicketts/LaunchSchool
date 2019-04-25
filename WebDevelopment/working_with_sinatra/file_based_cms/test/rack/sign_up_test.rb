Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class SignUpTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

  def test_signup_form
    skip
    url = '/users/signup'

    assert_equal(200, last_response.status)

  end
end
