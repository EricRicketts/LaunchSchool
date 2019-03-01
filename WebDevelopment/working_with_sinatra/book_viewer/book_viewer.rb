require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pry-byebug'

before do
  @title = "The Adventures of Sherlock Holmes"
  @table_of_contents = File.readlines('data/toc.txt', chomp: true)
  @chapter_titles = @table_of_contents.map.with_index(1) do |title, idx|
    "Chapter #{idx}:&nbsp;&nbsp;#{title}"
  end
  @chapters = Dir.entries('data').select { |f| f.match?(/chp\d+\.txt/) }.sort_by do |chapter|
    chapter.match(/\d+/)[0].to_i
  end
  @titles_and_chapters = (@table_of_contents.zip(@chapters)).to_h
  @standard_locals = { title: @title, contents: @table_of_contents }
end

helpers do

  def extract_path(chapter_number, paragraph)
    id = paragraph.match(/<p\s+id="(\w+)"\s*>/)[1]
    "chapters/#{chapter_number}\##{id}"
  end

  def find_chapters(regex)
    @titles_and_chapters.select do |title, chapter|
      file = File.read("data/#{chapter}")
      file.split(/\n/).find { |line| line.match?(regex) }
    end
  end

  def find_paragraphs(chapter_results, search_term)
    chapters_and_paragraphs = {}

    unless chapter_results.empty?
      chapter_results.each do |title, chapter|
        paragraph_regex = Regexp.new(/<p\s+id="\w+">[^<]*#{search_term}[^<]*<\/p>/)
        chapter_number = chapter.match(/\d+/)[0].to_i
        formatted_content = in_paragraphs(chapter_number)
        paragraphs = formatted_content.scan(paragraph_regex)
        chapters_and_paragraphs[title] = [chapter_number, paragraphs]
      end
    end
    binding.pry
    chapters_and_paragraphs
  end

  def in_paragraphs(chapter_number)
    redirect to ("/"), 303 unless (1..@table_of_contents.size).cover?(chapter_number)
    chapter_relative_path = "data/chp#{chapter_number}.txt"
    chapter = File.read(chapter_relative_path)
    chapter_string = chapter_relative_path.match(/chp\d+/)[0]

    lines =  chapter.split(/\n{2}/).map { |line| line.gsub(/\n/, ' ') }
    lines.map.with_index do |line, idx|
      "<p id=\"#{chapter_string}_#{idx}\">" << line << "</p>"
    end.join
  end

  def search_chapters_and_paragraphs(search_term)
    chapter_results = []

    unless !search_term || search_term.strip.empty?
      regex = Regexp.new(search_term)
      chapter_results = find_chapters(regex)
    end

    find_paragraphs(chapter_results, search_term)
  end

  def search_for_term(search_term)
    search_results = []
    unless !search_term || search_term.strip.empty?
      regex = Regexp.new(search_term)
      search_results = find_chapters(regex)
    end
    search_results.empty? ? [] : search_results.map { |title, chapter| [title, chapter.scan(/\d+/)[0]] }.to_h
  end
end

get "/" do
  erb :home, :locals => @standard_locals
end

get "/chapters/:number" do
  chapter_locals = {
    chapter_title: @chapter_titles[params[:number].to_i - 1],
    chapter: in_paragraphs(params[:number].to_i)
  }
  erb :chapter, :locals => @standard_locals.merge(chapter_locals)
end

get "/search" do
  results = search_chapters_and_paragraphs(params[:query])
  erb :search, :locals => @standard_locals.merge({ results: results })
end

not_found do
  redirect to("/"), 303
end
