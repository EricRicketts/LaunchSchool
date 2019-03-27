require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "rack_session_access"
require 'pry-byebug'

configure do
  enable :sessions
  use RackSessionAccess::Middleware if ENV['APP_ENV'] == 'test'
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

get "/lists/new" do
  erb :new_list, layout: :layout
end

post "/lists" do
  session[:lists] << { name: params[:list_name], todos: [] }
  session[:success] = "The list has been created."
  redirect "/lists"
end
