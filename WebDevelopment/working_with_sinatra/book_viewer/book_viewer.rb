require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pry-byebug'

get "/" do
  table_of_contents = File.readlines('data/toc.txt', chomp: true)
  erb :home, :locals => {
    :title => "The Adventures of Sherlock Holmes",
    :toc => table_of_contents
  }
end
