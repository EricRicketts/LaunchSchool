require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'rack_session_access'
require 'pry-byebug'

PROJECT_DIR = '/Documents/LaunchSchool/WebDevelopment/working_with_sinatra/file_based_cms/'
configure do
  enable :sessions
  use RackSessionAccess::Middleware if ENV['APP_ENV'] == 'test'
  set :erb, escape_html: true
end

  helpers do
    def change_directory(dir)
      Dir.home << PROJECT_DIR << dir
    end

    def get_data
      d = Dir.new(change_directory('data'))
      d.select { |fname| fname.match?(/[[:alnum:]]+\.txt/) }
    end
  end

get "/" do
  erb :index
end