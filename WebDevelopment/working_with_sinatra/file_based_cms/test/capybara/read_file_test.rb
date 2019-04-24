Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class ReadFileTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_text_files
    # skip
    expected = 'First line of foo.txt This is the second line in foo.txt which is a text file.'
    fname = fnames.first
    url = home_path + fname

    visit url
    assert_equal(expected, page.text)
  end

  def test_process_markdown_files
    # skip
    fname = fnames.last
    url = home_path + fname

    visit url
    assert_selector('h1', text: 'Foo', count: 1)
    assert_selector('p', text: 'This is a paragraph in foo.md which is a markdown file.', count: 1)
  end
end