require "sinatra/base"
require "sinatra/reloader"
require "tilt/erubis"
require "rack_session_access"
require "pry-byebug"
require_relative "./config_and_filters/before_filters"
require_relative "./config_and_filters/config"
require_relative "./helpers/helpers"

class TodoModular < Sinatra::Base
  register Sinatra::Config
  register Sinatra::BeforeFilters
  helpers Sinatra::Helpers

  enable_sessions
  init_session

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
    if (1..100).cover?(list_name.size)
      message = "The list has been created."
      set_flash(:success, message)
      session[:lists] << { name: list_name, todos: [] }
      redirect "/lists"
    else
      message = "List name must be between 1 and 100 characters."
      set_flash(:error, message)
      erb :new_list, locals: { key: :error }, layout: :layout
    end
  end
end
