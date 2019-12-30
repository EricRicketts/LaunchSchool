require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise8Test < Minitest::Test

  def setup
    $stdout = StringIO.new
    $stdin = StringIO.new("FooBar\nFooBar\n")
  end

  def teardown
    $stdout = STDOUT
    $stdin = STDIN
  end

  def set_password
    $stdout.puts 'What would you like your password to be?'
    new_password = $stdin.gets.chomp
    password = new_password
  end

  def set_password_fix
    $stdout.puts 'What would you like your password to be?'
    $stdin.gets.chomp
  end

  def verify_password
    $stdout.puts '** Login **'
    $stdout.puts 'Password:'
    input = $stdin.gets.chomp

    if input == password
      $stdout.puts 'Welcome to the inside!'
    else
      $stdout.puts 'Authentication failed.'
    end
  end

  def verify_password_fix(password)
    $stdout.puts '** Login **'
    $stdout.puts 'Password:'
    input = $stdin.gets.chomp

    if input == password
      $stdout.puts 'Welcome to the inside!'
    else
      $stdout.puts 'Authentication failed.'
    end
  end

  def test_wrong_answer
    password = nil

    if !password
      password = set_password
    end

    assert_raises(NameError) { verify_password }
  end

  def test_fix
    password = nil

    if !password
      password = set_password_fix
    end

    verify_password_fix(password)

    assert_match(/Welcome to the inside!/, $stdout.string)
  end
end
