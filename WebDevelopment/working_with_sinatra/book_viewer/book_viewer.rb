require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pry-byebug'

get "/" do
  table_of_contents = File.readlines('data/toc.txt', chomp: true)
  chapter_titles = table_of_contents.map.with_index(1) do |title, idx|
    "Chapter #{idx} #{title}"
  end
  erb :home, :locals => {
    :title => "The Adventures of Sherlock Holmes",
    :contents => table_of_contents
  }
end

get "/chapters/:number" do
  table_of_contents = File.readlines('data/toc.txt', chomp: true)
  chapter_number = params[:number].to_i
  chapter = File.readlines("data/chp#{chapter_number}.txt")
  chapter_titles = table_of_contents.map.with_index(1) do |title, idx|
    "Chapter #{idx}:&nbsp;&nbsp;#{title}"
  end
  erb :chapter, :locals => {
    :title => "The Adventures of Sherlock Holmes",
    :contents => table_of_contents,
    :chapter_title => chapter_titles[chapter_number - 1],
    :chapter => chapter
  }
end
