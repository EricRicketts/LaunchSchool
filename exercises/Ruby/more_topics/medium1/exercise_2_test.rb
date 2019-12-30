require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise2Test < Minitest::Test
  attr_accessor :text_analyzer

  class TextAnalyzer
    def process
      return "No file given" unless block_given?
      file = File.open("exercise_2_test.txt")
      result = yield(file)
      file.close
      result
    end
  end

  def setup
    @text_analyzer = TextAnalyzer.new
  end

  def test_process_count_lines
    result = text_analyzer.process do |file|
      line_count = 0
      file.each_line { |line| line_count += 1 }
      "#{line_count} lines"
    end
    assert_equal("15 lines", result)
  end

  def test_process_count_words
    result = text_analyzer.process do |file|
      word_count = 0
      file.each_line do |line|
        word_count += line.scan(/\w+/).length
      end
      "#{word_count} words"
    end
    assert_equal("126 words", result)
  end

  def test_process_count_paragraphs
    result = text_analyzer.process do |file|
      paragraph_count = 0
      empty_line = /^\s*$/
      file.each_line do |line|
        paragraph_count += 1 if line.match?(empty_line) || file.eof?
      end
    "#{paragraph_count} paragraphs"
    end
    assert_equal("3 paragraphs", result)
  end

  def test_process_no_block
    assert_equal("No file given", text_analyzer.process)
  end
end