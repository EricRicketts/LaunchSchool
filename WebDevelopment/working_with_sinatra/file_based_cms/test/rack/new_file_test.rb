Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class NewFileTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

  def test_signed_in_for_new_document
    # skip
    url = '/new'
    flash_message = 'You must be signed in to do that.'
    get url

    assert_equal(302, last_response.status)

    get home_page
    assert_includes(last_response.body, flash_message)
  end

  def test_new_file_page
    # skip
    url = '/new'
    get url, {}, admin_session

    assert_equal(200, last_response.status)
    form_opening_tag = "<form action=\"/new\" method=\"post\" accept-charset=\"utf-8\">"
    label_element = '<label for="new" class="block-style">Add a new document:</label>'
    input_element = '<input type="text" id="new" name="new">'
    button_element = '<button type="submit">Create</button>'

    tags_and_elements = [
      form_opening_tag, label_element, input_element, button_element
    ]

    matched_tags_or_elements = []
    tags_and_elements.each do |tag_or_element|
      matched_tags_or_elements << last_response.body.scan(tag_or_element)
    end

    assert matched_tags_or_elements.size == 4 && matched_tags_or_elements.none?(&:empty?)
    matched_tags_or_elements.each do |tag_or_element|
      assert_equal(1, tag_or_element.size)
    end
  end

  def test_signed_in_to_submit_new_file
    # skip
    url = '/new'
    new_file_name = 'new_file.txt'
    flash_message = 'You must be signed in to do that.'

    post(url, params = { new: new_file_name })
    assert_equal(302, last_response.status)

    get home_page
    assert_includes(last_response.body, flash_message)
  end

  def test_create_new_file
    # skip
    url = '/new'
    new_file_name = 'new_file.txt'
    new_file_link = '<a href="/new_file.txt">new_file.txt</a>'
    flash_message = "#{new_file_name} was created."
    post(url, params = { new: new_file_name }, admin_session)

    assert_equal(302, last_response.status)
    assert_equal(flash_message, session[:message])

    get last_response.headers['Location']
    assert_equal(200, last_response.status)

    assert_equal(1, last_response.body.scan(new_file_link).size)
  end

  def test_create_new_file_blank_entry
    # skip
    url = '/new'
    flash_message = 'A name is required.'
    post(url, params = { new: '   ' }, admin_session)

    assert_equal(422, last_response.status)
    assert_equal(1, last_response.body.scan(flash_message).size)
  end
end