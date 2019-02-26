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
end

helpers do
  def in_paragraphs(chapter)
    lines = chapter.split(/\n{2}/).map { |line| line.gsub(/\n/, ' ') }
    paragraphs = lines.map { |line| "<p>" << line << "</p>" }
    paragraphs.join
  end
end

get "/" do
  erb :home, :locals => {
    :title => @title,
    :contents => @table_of_contents
  }
end

get "/chapters/:number" do
  chapter_number = params[:number].to_i
  chapter = File.read("data/chp#{chapter_number}.txt")
  erb :chapter, :locals => {
    :contents => @table_of_contents,
    :chapter_title => @chapter_titles[chapter_number - 1],
    :chapter => in_paragraphs(chapter)
  }
end
