require "sinatra/base"
require "sinatra/reloader"
require "tilt/erubis"

class TodoModular < Sinatra::Base

  get "/" do
    redirect "/lists"
  end

  get "/lists" do
    @lists = [
      { name: "Lunch Groceries", todos: [] },
      { name: "Dinner Groceries", todos: [] }
    ]
    erb :lists, layout: :layout
  end
end
