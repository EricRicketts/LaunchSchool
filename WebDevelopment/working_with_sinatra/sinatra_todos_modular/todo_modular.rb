require "sinatra/base"
require "sinatra/reloader"
require "tilt/erubis"
require_relative "./config_and_filters/before_filters"
require_relative "./config_and_filters/config"

class TodoModular < Sinatra::Base
  register Sinatra::Config
  register Sinatra::BeforeFilters

  enable_sessions
  init_session

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
    redirect "/lists"
  end
end
