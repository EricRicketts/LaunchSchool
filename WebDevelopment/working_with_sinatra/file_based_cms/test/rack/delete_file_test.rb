Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

require 'rack/test'

class DeleteFileTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

  def test_delete_file_option_on_home_page
    # skip
    get home_page

    assert_equal(2, last_response.body.scan('Delete').size)
  end

  def test_signed_in_to_delete
    # skip
    file = 'foo.md'
    url = "/#{file}/delete"
    flash_message = 'You must be signed in to do that.'

    delete url
    assert_equal(302, last_response.status)

    get home_page
    assert_includes(last_response.body, flash_message)
  end

  def test_delete_file
    # skip
    file = 'foo.txt'
    url = "/#{file}/delete"
    file_reference = "/foo.txt"
    flash_message = 'foo.txt has been deleted.'

    delete(url, {}, admin_session)
    assert_equal(302, last_response.status)
    assert_equal(flash_message, session[:message])

    get last_response.headers['Location']
    assert_equal(200, last_response.status)
    refute_includes(last_response.body, file_reference)
  end
end
