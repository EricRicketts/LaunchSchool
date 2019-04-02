# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'rack_session_access'
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
  def error_for_list_name(name)
    if !(1..100).cover?(name.size)
      'List name must be between 1 and 100 characters.'
    elsif session[:lists].any? { |list| list[:name] == name }
      'List name must be unique.'
    else
      false
    end
  end

  def error_for_todo(name)
    if !(1..100).cover?(name.size)
      'Todo must be between 1 and 100 characters.'
    else
      false
    end
  end

  def list_complete?(list)
    list[:todos].size > 0 && list[:todos].all? { |todo| todo[:completed] }
  end

  def set_flash(key, message = '')
    session[key] = message
  end
end

get '/' do
  redirect '/lists'
end

get '/lists' do
  @lists = session[:lists]
  locals = session.key?(:success) ? { key: :success } : { key: :none }
  erb :lists, locals: locals, layout: :layout
end

get '/lists/new' do
  erb :new_list, locals: { key: :none }, layout: :layout
end

get '/lists/:list_id' do |list_id|
  list = session[:lists][list_id.to_i]
  key = session.key?(:success) ? :success : :none
  erb :list, locals: { list: list, list_id: list_id, key: key }, layout: :layout
end

get '/lists/:list_id/edit' do |list_id|
  list = session[:lists][list_id.to_i]
  erb :edit_list, locals: { list: list, list_id: list_id, key: :none }, layout: :layout
end

delete '/lists/:list_id' do |list_id|
  session[:lists].delete_at(list_id.to_i)
  session[:success] = 'The list has been deleted.'
  redirect '/lists'
end

delete '/lists/:list_id/todos/:todo_id' do |list_id, todo_id|
  list = session[:lists][list_id.to_i]
  list[:todos].delete_at(todo_id.to_i)
  session[:success] = 'The todo has been deleted.'
  redirect "/lists/#{list_id}"
end

patch '/lists/:list_id/todos/:todo_id' do |list_id, todo_id|
  completed_value = params[:completed].to_s == "true"
  list = session[:lists][list_id.to_i]
  list[:todos][todo_id.to_i][:completed] = completed_value
  session[:success] = "The todo has been updated."
  redirect "/lists/#{list_id}"
end

patch '/lists/:list_id/todos' do |list_id|
  list = session[:lists][list_id.to_i]
  list[:todos].each { |todo| todo[:completed] = true }
  session[:success] = "All todos have been completed."
  redirect "/lists/#{list_id}"
end

post '/lists' do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  if error
    set_flash(:error, error)
    erb :new_list, locals: { key: :error }, layout: :layout
  else
    message = 'The list has been created.'
    set_flash(:success, message)
    session[:lists] << { name: list_name, todos: [] }
    redirect '/lists'
  end
end

post '/lists/:list_id' do |list_id|
  list = session[:lists][list_id.to_i]
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    set_flash(:error, error)
    erb :edit_list, locals: { list: list, list_id: list_id, key: :error }, layout: :layout
  else
    message = 'The list has been updated.'
    set_flash(:success, message)
    session[:lists][list_id.to_i][:name] = list_name
    redirect "/lists/#{list_id}"
  end
end

post '/lists/:list_id/todos' do |list_id|
  list = session[:lists][list_id.to_i]
  todo = params[:todo].strip
  error = error_for_todo(todo)

  if error
    session[:error] = error
    erb :list, locals: { list: list, list_id: list_id, key: :error}, layout: :layout
  else
    session[:lists][list_id.to_i][:todos] << { name: todo, completed: false }
    message = 'The todo was added.'
    set_flash(:success, message)
    redirect "/lists/#{list_id}"
  end
end
