require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pry-byebug'

get "/" do
  file_list = Dir.entries("./public").select { |file| file.match?(/\w+\.txt/) }
  sorted_file_list = params['sort_order'] == 'descending' ? file_list.sort.reverse : file_list.sort
  erb :home, :locals => {
    :title => "Dynamic Directory Index",
    :files => sorted_file_list,
    :sort_order => params['sort_order']
  }
end
