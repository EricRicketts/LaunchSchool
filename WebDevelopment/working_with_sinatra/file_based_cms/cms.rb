require 'redcarpet'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'rack_session_access'
require 'pry-byebug'

configure do
  enable :sessions
  use RackSessionAccess::Middleware if ENV['RACK_ENV'] == 'test'
  set :erb, escape_html: true
end

helpers do
  def file_exists?(dir, file)
    files = Dir.glob("*", base: dir)
    files.include?(file)
  end

  def process_file_type(dir, fname)
    suffix = fname.split(".").last
    case suffix
    when "txt"
      render_text(dir, fname)
    else
      render_markdown(dir, fname)
    end
  end

  def render_markdown(dir, fname)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    headers['Content-Type'] = 'text/html; charset=utf-8'
    markdown.render(File.read(dir + "/#{fname}"))
  end

  def render_text(dir, fname)
    headers['Content-Type'] = 'text/plain'
    File.read(dir + "/#{fname}")
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

get "/" do
  dir = data_path
  @files = Dir.glob("*", base: dir)
  erb :index
end

get "/new" do
  erb :new
end

get "/:fname" do |fname|
  dir = data_path
  if file_exists?(dir, fname)
    process_file_type(dir, fname)
  else
    session[:message] = "#{fname} does not exist."
    redirect "/"
  end
end

get "/:fname/edit" do |fname|
  dir = data_path
  if file_exists?(dir, fname)
    @fname = fname
    @file = File.read(dir + "/#{fname}")
    erb :edit
  else
    session[:message] = "#{fname} does not exist."
    redirect "/"
  end
end

patch "/:fname" do |fname|
  file_content = params[:file]
  File.write(data_path + "/#{fname}", file_content)
  session[:message] = "#{fname} has been updated."
  redirect "/"
end

post "/new" do
  new_file = params[:new]
  File.new(data_path + "/#{new_file}", "w+")
  redirect "/"
end
