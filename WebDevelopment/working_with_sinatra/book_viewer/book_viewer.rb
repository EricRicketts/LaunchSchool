require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pry-byebug'

get "/" do
  table_of_contents = File.readlines('data/toc.txt', chomp: true)
  erb :home, :locals => {
    :title => "The Adventures of Sherlock Holmes",
    :contents => table_of_contents
  }
end

get "/chapters/1" do
  table_of_contents = File.readlines('data/toc.txt', chomp: true)
  chapter_1 = File.readlines('data/chp1.txt')
  chapter_1_modified = chapter_1.map do |line|
    line.gsub(/\n/, '<br>')
  end
  erb :chapter, :locals => {
    :title => "The Adventures of Sherlock Holmes",
    :contents => table_of_contents,
    :chapter => chapter_1_modified
  }
end
