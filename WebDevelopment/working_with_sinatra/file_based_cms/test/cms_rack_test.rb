ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'fileutils'
require 'pry-byebug'
require_relative '../cms'

class CmsRackTest < Minitest::Test
  attr_reader :home_page, :dir, :fnames

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def session
    last_request.env['rack.session']
  end

  def setup
    @home_page = '/'
    @fnames = %w[foo.txt foo.md]
    @dir = data_path
    fnames.each { |fname| FileUtils.mkdir_p(data_path) }
    fnames.each do |fname|
      File.open(dir + "/#{fname}", "w+") do |f|
        if fname == 'foo.txt'
          f.puts 'First line of foo.txt'
          f.puts 'This is the second line in foo.txt which is a text file.'
        else
          f.puts '# Foo'
          f.puts 'This is a paragraph in foo.md which is a markdown file.'
        end
      end
    end
  end

  def admin_session
    { 'rack.session' => { username: 'admin', password: 'secret' } }
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def test_home_page
    # skip
    get home_page
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response.headers['Content-Type'])
    links = last_response.body.scan(/(>#{fnames.first}|>#{fnames.last})/)
    new_document_link = last_response.body.scan(/New Document/)

    assert_equal(2, links.size)
    assert_equal(1, new_document_link.size)
    assert_equal(1, last_response.body.scan(/Sign\sIn/).size)
  end

  def test_text_file_content
    # skip
    url = home_page + fnames.first
    expected = "First line of foo.txt\n" +
      "This is the second line in foo.txt which is a text file.\n"

    get url

    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response.headers['Content-Type'])
    assert_equal(expected, last_response.body)
  end

  def test_invalid_route
    # skip
    filename = 'bar.txt'
    url = home_page + filename
    expected = "#{filename} does not exist."

    get url
    assert_equal(302, last_response.status)
    assert_equal(expected, session[:message])
  end

  def test_markdown_renders_to_html
    # skip
    url = home_page + fnames.last
    header = '<h1>Foo</h1>'
    paragraph = '<p>This is a paragraph in foo.md which is a markdown file.</p>'
    get url

    assert_equal(200, last_response.status)
    assert_equal('text/html; charset=utf-8', last_response.headers['Content-Type'])
    assert_includes(last_response.body, header)
    assert_includes(last_response.body, paragraph)
  end

  def test_edit_links_exist
    # skip
    get home_page

    edit_links = [
      "<a href=\"/#{fnames.first}/edit\">Edit</a>",
      "<a href=\"/#{fnames.last}/edit\">Edit</a>"
    ]

    assert_equal(edit_links.size, last_response.body.scan(/Edit/).size)
    edit_links.each do |edit_link|
      assert_includes(last_response.body, edit_link)
    end
  end

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

  def test_signin_form_exists
    # skip
    url = '/users/signin'
    username_label = '<label for="username">Username:</label>'
    username_input = '<input type="text" name="username" id="username"'
    password_label = '<label for="password">Password:</label>'
    password_input = '<input type="text" name="password" id="password"'
    button = '<button type="submit">Sign In</button>'

    get url

    labels_and_inputs = [
      username_label, username_input, button,
      password_label, password_input
    ]
    assert_equal(200, last_response.status)
    labels_and_inputs.each do |label_or_input|
      assert_equal(1, last_response.body.scan(label_or_input).size)
    end
  end

  def test_valid_signin
    # skip
    flash_message = 'Welcome!'
    url = '/users/signin'
    signout_text = 'Signed in as admin.'
    username = 'admin'
    password = 'secret'
    post(url, params = { username: '  admin  ', password: '  secret  '} )

    assert_equal(302, last_response.status)
    assert_equal(flash_message, session[:message])
    assert_equal(username, session[:username])
    assert_equal(password, session[:password])

    get last_response.headers['Location']
    assert_equal(200, last_response.status)

    assert_equal(1, last_response.body.scan(signout_text).size)
    assert_match(/<input.*value="Sign Out"/, last_response.body)
  end

  def test_invalid_signin
    # skip
    flash_message = 'Invalid Credentials'
    username = 'Foo Bar'
    url = '/users/signin'
    post(url, params = { username: 'Foo Bar', password: 'secret' })

    assert_equal(422, last_response.status)
    assert_equal(username, session[:username])
    assert_includes(last_response.body, flash_message)
  end

  def test_signout
    # skip
    flash_message = 'You have been signed out.'
    url = '/users/signout'
    post url

    assert_equal(302, last_response.status)
    assert_equal(flash_message, session[:message])
    get "/"

    assert_equal(200, last_response.status)
    refute_includes('Signed in as admin.', last_response.body)
    refute_match(/<input.*value="Sign Out"/, last_response.body)
  end
end
