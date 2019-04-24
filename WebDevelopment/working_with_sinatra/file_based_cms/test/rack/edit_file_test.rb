Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class EditFileTest < Minitest::Test
  include SetupAndTeardown
  include Rack::Test::Methods

  def test_invalid_edit_attempt
    # skip
    url = home_page + fnames.first + '/edit'
    flash_message = 'You must be signed in to do that.'
    get url

    assert_equal(302, last_response.status)

    get home_page
    assert_includes(last_response.body, flash_message)
  end

  def test_edit_file_link
    # skip
    url = home_page + fnames.last + '/edit'
    get url, {}, admin_session

    form_opening_tag = "<form action=\"/foo.md\" method=\"post\" accept-charset=\"utf-8\">"
    input_element = "<input type=\"hidden\" name=\"_method\" value=\"patch\">"
    label_element_text = "Edit content of #{fnames.last}:"
    textarea_opening_tag = "<textarea id=\"file\" name=\"file\" rows=\"20\" cols=\"30\">"
    textarea_text = "\# Foo\nThis is a paragraph in foo.md which is a markdown file."
    button_element_text = 'Save Changes'

    expected_tags_or_elements = [
      form_opening_tag, input_element, label_element_text,
      textarea_opening_tag, textarea_text, button_element_text
    ]


    matched_tags_or_elements = []
    expected_tags_or_elements.each do |tag_or_element|
      matched_tags_or_elements << last_response.body.scan(tag_or_element)
    end

    assert matched_tags_or_elements.size == 6 && matched_tags_or_elements.none?(&:empty?)
    matched_tags_or_elements.each do |tag_or_element|
      assert_equal(1, tag_or_element.size)
    end
  end

  def test_invalid_update_a_file_attempt
    # skip
    url = home_page + fnames.first
    flash_message = 'You must be signed in to do that.'

    patch(url, params = { file: "New foo.txt\nthis is the new text for the test." })
    assert_equal(302, last_response.status)

    get home_page
    assert_includes(last_response.body, flash_message)
  end

  def test_update_a_file
    # skip
    url = home_page + fnames.first
    flash_message = 'foo.txt has been updated.'
    patch(url, params = { file: "New foo.txt\nthis is the new text for the test." }, admin_session)

    assert_equal(302, last_response.status)
    assert_equal(flash_message, session[:message])

    edited_file = File.read(dir + "/#{fnames.first}")
    assert_equal("New foo.txt\nthis is the new text for the test.", edited_file)
  end
end