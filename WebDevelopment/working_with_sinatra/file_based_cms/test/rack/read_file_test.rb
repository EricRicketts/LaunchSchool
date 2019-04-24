Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/rack/*.rb', __FILE__)].each { |file| require file }

class ReadFileTest < Minitest::Test
  include RackSetupAndTeardown
  include Rack::Test::Methods

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

  def test_markdown_file
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
