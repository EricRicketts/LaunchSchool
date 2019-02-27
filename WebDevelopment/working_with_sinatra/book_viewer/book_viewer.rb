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
  def in_paragraphs(chapter)
    lines = chapter.split(/\n{2}/).map { |line| line.gsub(/\n/, ' ') }
    paragraphs = lines.map { |line| "<p>" << line << "</p>" }
    paragraphs.join
  end

  def get_chapter(chapter_query)
    chapter_number = chapter_query.to_i
    redirect to ("/"), 303 unless (1..@table_of_contents.size).cover?(chapter_number)
    File.read("data/chp#{chapter_number}.txt")
  end
end

get "/" do
  erb :home, :locals => @standard_locals
end

get "/chapters/:number" do
  chapter = get_chapter(params[:number])
  chapter_locals = {
    chapter_title: @chapter_titles[params[:number].to_i - 1],
    chapter: in_paragraphs(chapter)
  }
  # erb :chapter, :locals => {
  #   :title => @title,
  #   :contents => @table_of_contents,
  #   :chapter_title => @chapter_titles[params[:number].to_i - 1],
  #   :chapter => in_paragraphs(chapter)
  # }
  erb :chapter, :locals => @standard_locals.merge(chapter_locals)
end

get "/search" do
  search_term = params[:query]
  @search_results = []
  unless !search_term || search_term.strip.empty?
    regex = Regexp.new(search_term)
    @search_results = @titles_and_chapters.select do |title, chapter|
      file = File.read("data/#{chapter}")
      file.split(/\n/).find { |line| line.match?(regex) }
    end
  end
  if @search_results.empty?
    @results = []
  else
    @results = @search_results.map { |title, chapter| [title, chapter.scan(/\d+/)[0]] }.to_h
  end
  erb :search, :locals => {
    :title => @title,
    :contents => @table_of_contents,
    :results => @results
  }
end

not_found do
  redirect to("/"), 303
end
