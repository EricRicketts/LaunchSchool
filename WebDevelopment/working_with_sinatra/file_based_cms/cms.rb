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
    case File.extname(dir + "/#{fname}")
    when '.txt'
      render_text(dir, fname)
    when '.md'
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

  def require_signed_in_user
    unless valid_signin?
      session[:message] = 'You must be signed in to do that.'
      redirect "/"
    end
  end

  def valid_signin?
    session[:username] == 'admin' && session[:password] == 'secret'
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
  require_signed_in_user
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
  require_signed_in_user
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

get "/users/signin" do
  erb :signin
end

patch "/:fname" do |fname|
  require_signed_in_user
  file_content = params[:file]
  File.write(data_path + "/#{fname}", file_content)
  session[:message] = "#{fname} has been updated."
  redirect "/"
end

delete "/:fname/delete" do |fname|
  require_signed_in_user
  File.delete(data_path + "/#{fname}")
  session[:message] = "#{fname} has been deleted."
  redirect "/"
end

post "/new" do
  require_signed_in_user
  new_file = params[:new].strip
  if new_file.empty?
    session[:message] = 'A name is required.'
    status 422
    erb :new
  else
    File.new(data_path + "/#{new_file}", "w+")
    session[:message] = "#{new_file} was created."
    redirect "/"
  end
end

post '/users/signin' do
  session[:username] = params[:username].strip
  session[:password] = params[:password].strip
  if valid_signin?
    session[:message] = 'Welcome!'
    redirect "/"
  else
    status 422
    session[:message] = 'Invalid Credentials'
    erb :signin
  end
end

post '/users/signout' do
  session.delete(:username)
  session.delete(:password)
  session[:message] = 'You have been signed out.'
  redirect "/"
end
