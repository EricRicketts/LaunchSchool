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
    get last_response.headers['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, expected)

    get home_page
    refute_includes(last_response.body, expected)
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

  def test_edit_file_link
    # skip
    url = home_page + fnames.last + '/edit'
    get url

    form_opening_tag = "<form action=\"/#{fnames.last}\" method=\"post\" accept-charset=\"utf-8\">"
    input_element = "<input type=\"hidden\" name=\"_method\" value=\"patch\">"
    label = "<label for=\"file\" style=\"display: block;\">Edit content of #{fnames.last}:</label>"
    textarea_opening_tag = "<textarea id=\"file\" name=\"file\" rows=\"20\" cols=\"30\">"
    text = "\# Foo\nThis is a paragraph in foo.md which is a markdown file."
    textarea_closing_tag = "</textarea>"
    button_element = "<button type=\"submit\" style=\"display: block;\" >Save Changes</button>"
    form_closing_tag = "</form>"

    expected_tags_or_elements = [
      form_opening_tag, input_element, label, textarea_opening_tag,
      textarea_closing_tag, button_element, form_closing_tag
    ]

    expected_tags_or_elements.each do |tag_or_element|
      assert_includes(last_response.body, tag_or_element)
    end
  end

  def test_update_a_file
    # skip
    url = home_page + fnames.first
    flash_message = 'foo.txt has been updated.'
    patch(url, params={file: "New foo.txt\nthis is the new text for the test."})

    assert_equal(302, last_response.status)
    edited_file = File.read(dir + "/#{fnames.first}")
    assert_equal("New foo.txt\nthis is the new text for the test.", edited_file)

    get home_page
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, flash_message)
  end
end
