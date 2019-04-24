Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class EditFileTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_no_edit_without_sigin
    # skip
    fname = fnames.first
    flash_message = 'You must be signed in to do that.'
    visit home_path

    page.find_link('Edit', href: "/#{fname}/edit").click
    assert_text(flash_message, count: 1)
    assert_current_path(home_path)
  end

  def test_edit_a_file
    # skip
    fname = fnames.first
    original_text = "First line of foo.txt This is the second line in foo.txt which is a text file."
    new_text = 'new text for foo.txt'
    flash_message = "#{fname} has been updated."
    signin_user

    page.find_link('Edit', href: "/#{fname}/edit").click

    assert_includes(page.text, original_text)
    page.fill_in('file', with: new_text)
    page.find_button('Save Changes').click

    assert_current_path(home_path)
    assert_text(flash_message, count: 1)

    page.find_link(fname).click
    assert_text(new_text, count: 1)
    assert_no_text(flash_message)
  end
end