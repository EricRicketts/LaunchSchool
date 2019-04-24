Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class DeleteFileTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_delete_file
    # skip
    file_name = 'foo.txt'
    remaining_file_name = 'foo.md'
    flash_message = 'foo.txt has been deleted.'
    signin_user

    assert_text('Delete', count: 2)
    page.find('button[form="form_1"]').click
    assert_text(flash_message, count: 1)
    assert_text(remaining_file_name, count: 1)
  end
end