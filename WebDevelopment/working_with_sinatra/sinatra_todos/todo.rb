require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  erb "<p>You have no lists.</p>", layout: :layout
end
