require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'rack_session_access'
require 'pry-byebug'

configure do
  enable :sessions
  use RackSessionAccess::Middleware if ENV['APP_ENV'] == 'test'
  set :erb, escape_html: true
end

  helpers do
    def get_full_path(file)
      File.expand_path(file)
    end

  end

get "/" do
  dir = get_full_path("data")
  @files = Dir.glob("*.txt", base:dir)
  erb :index
end

get "/:fname" do |fname|
  dir = get_full_path("data")
  headers['Content-Type'] = 'text/plain'
  File.read(dir << "/#{fname}")
end