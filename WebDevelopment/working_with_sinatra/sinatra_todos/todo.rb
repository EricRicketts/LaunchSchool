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

helpers do
  def set_flash(key, message="")
    session[key] = message
  end

  def error_for_list_name(name)
    if !(1..100).cover?(name.size)
      "List name must be between 1 and 100 characters."
    elsif session[:lists].any? { |list| list[:name] == name }
      "List name must be unique."
    else
      false
    end
  end
end

get "/" do
  redirect "/lists"
end

get "/lists" do
  @lists = session[:lists]
  locals = session.has_key?(:success) ? { key: :success } : { key: :none }
  erb :lists, locals: locals, layout: :layout
end

get "/lists/new" do
  erb :new_list, locals: { key: :none }, layout: :layout
end

post "/lists" do
  list_name = params[:list_name].strip
  if error = error_for_list_name(list_name)
    set_flash(:error, error)
    erb :new_list, locals: { key: :error }, layout: :layout
  else
    message = "The list has been created."
    set_flash(:success, message)
    session[:lists] << { name: list_name, todos: [] }
    redirect "/lists"
  end
end
