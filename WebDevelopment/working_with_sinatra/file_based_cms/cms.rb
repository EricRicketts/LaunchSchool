require 'redcarpet'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'bcrypt'
require 'yaml'
require 'rack_session_access'
require 'pry-byebug'

ALLOWED_SUFFIXES = %w[
  .txt .md .tif .jpeg .jpg
  .gif .png .svg .eps .pdf
]

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

  def invalid_signup?(username, password)
    username.empty? || password.empty?
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
    unless user_signed_in?
      session[:message] = 'You must be signed in to do that.'
      redirect "/"
    end
  end

  def user_signed_in?
    session.key?(:username)
  end

  def valid_credentials?(username, password)
    credentials = load_user_credentials

    if credentials.key?(username)
      bcrypt_password = BCrypt::Password.new(credentials[username])
      bcrypt_password == password
    else
      false
    end
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

def invalid_file_entry?(fname)
  !ALLOWED_SUFFIXES.include?(File.extname(fname))
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def signup_user(username, password)
  original_dir = Dir.pwd
  Dir.chdir(data_path)

  Dir.chdir('../') do |path|
    yaml_file = File.read('users.yml')
    data = YAML.load(yaml_file)
    data[username] = BCrypt::Password.create(password).to_s
    output = YAML.dump(data)
    File.write('users.yml', output)
  end

  Dir.chdir(original_dir)
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
  # for file copy consider
  # t1 = Time.now.ctime.gsub(/\s+|:/, '_')
  # f.sub(/\.txt/, '.' + t1 + <file ending>)
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

get "/users/signup" do
  erb :signup
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
  if invalid_file_entry?(new_file)
    session[:message] = 'Missing file suffix or incorrect file type.'
    status 422
    erb :new
  else
    File.new(data_path + "/#{new_file}", "w+")
    session[:message] = "#{new_file} was created."
    redirect "/"
  end
end

post '/users/signin' do
  username = params[:username].strip
  password = params[:password].strip

  if valid_credentials?(username, password)
    session[:username] = username
    session[:message] = 'Welcome!'
    redirect "/"
  else
    session[:message] = 'Invalid Credentials'
    status 422
    erb :signin
  end
end

post '/users/signup' do
  username = params[:username].strip
  password = params[:password].strip

  if invalid_signup?(username, password)
    session[:message] = 'A name and password is required.'
    status 422
    erb :signup
  else
    session[:message] = 'Congrats!! You now have an account.'
    session[:username] = username
    signup_user(username, password)
    redirect "/"
  end
end

post '/users/signout' do
  session.delete(:username)
  session.delete(:password)
  session[:message] = 'You have been signed out.'
  redirect "/"
end
