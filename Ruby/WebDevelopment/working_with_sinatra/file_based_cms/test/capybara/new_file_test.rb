Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class NewFileTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_create_new_file
    # skip
    new_file_name = 'new_file.txt'
    flash_message = "#{new_file_name} was created."

    signin_user
    page.find_link('New Document').click

    assert_selector('form', count: 1)
    assert_selector('label', text: 'Add a new document:', count: 1)

    page.fill_in('new', with: new_file_name)
    page.find_button('Create').click

    assert_text(flash_message, count: 1)
    assert_selector('a', text: new_file_name, count: 1)
  end

  def test_incorrect_new_file_entry
    # skip
    flash_message = 'Missing file suffix or incorrect file type.'

    signin_user
    page.find_link('New Document').click

    page.fill_in('new', with: '   ')
    page.find_button('Create').click

    assert_text(flash_message, count: 1)
    assert_selector('form', count: 1)
  end

  def test_invalid_file_suffix
    # skip
    new_document_path = '/new'
    flash_message = 'Missing file suffix or incorrect file type.'

    signin_user
    page.find_link('New Document').click
    page.fill_in('new', with: 'bar.dxf')
    page.find_button('Create').click

    assert_text(flash_message, count: 1)
    assert_current_path(new_document_path)
  end
end
