Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }

class CmsRackHomePageTest < Minitest::Test
  include SetupAndTeardown

  def test_home_page
    # skip
    get home_page
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response.headers['Content-Type'])
    links = last_response.body.scan(/(>#{fnames.first}|>#{fnames.last})/)
    new_document_link = last_response.body.scan(/New Document/)
    edit_links = [
      "<a href=\"/#{fnames.first}/edit\">Edit</a>",
      "<a href=\"/#{fnames.last}/edit\">Edit</a>"
    ]

    assert_equal(2, links.size)
    assert_equal(1, new_document_link.size)
    assert_equal(1, last_response.body.scan(/Sign\sIn/).size)

    assert_equal(edit_links.size, last_response.body.scan(/Edit/).size)
    edit_links.each do |edit_link|
      assert_includes(last_response.body, edit_link)
    end
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
end
