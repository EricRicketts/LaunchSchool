Dir[File.expand_path('../../helpers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../helpers/capybara/*.rb', __FILE__)].each { |file| require file }

class HomePageTest < Minitest::Test
  include CapybaraSetupAndTeardown

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  Capybara.app = Sinatra::Application

  def test_home_path
    # skip
    visit home_path
    all_files = fnames + %w[foo.txt foo.md]

    assert_link('Edit', count: 2)
    all_files.each do |text|
      assert_link(text, count: 1)
    end
    assert_link('New Document', count: 1)
    assert_button('Sign In', count: 1)
  end

  def test_invalid_route
    # skip
    fname = 'bar_fizz_buzz.txt'
    url = home_path + fname
    expected = "#{fname} does not exist."
    visit url

    assert_text(expected, count: 1)
    visit home_path
    refute_text(expected)
  end
end
