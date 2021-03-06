# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'
require 'rack_session_access'
require 'pry-byebug'

configure do
  enable :sessions
  use RackSessionAccess::Middleware if ENV['APP_ENV'] == 'test'
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

before do
  session[:lists] ||= []
end

helpers do
  def create_id(arr)
    max = arr.map { |hsh| hsh[:id] }.max || 0
    max + 1
  end

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

  def flash_key
    if session.key?(:success )
      { key: :success }
    elsif session.key?(:error)
      { key: :error }
    else
      { key: :none }
    end
  end

  def list_class(list)
    "complete" if list_complete?(list)
  end

  def list_complete?(list)
    list_count(list) > 0 && todos_remaining(list).zero?
  end

  def list_count(list)
    list[:todos].size
  end

  def list_status(list)
    "#{todos_remaining(list)}/#{list_count(list)}"
  end

  def load_list(list_id)
    list = session[:lists].find { |list| list[:id] == list_id.to_i }
    if list_id && list
      list
    else
      message = 'The specified list was not found.'
      set_flash(:error, message)
      redirect '/lists'
    end
  end

  def set_flash(key, message = '')
    session[key] = message
  end

  def sort_lists_or_todos(arr, &block)
    complete, incomplete = arr.partition do |hsh|
      hsh.key?(:todos) ? list_complete?(hsh) : hsh[:completed]
    end

    incomplete.sort_by! { |hsh| hsh[:id] }.each(&block)
    complete.sort_by! { |hsh| hsh[:id] }.each(&block)
  end

  def todos_remaining(list)
    list[:todos].reject { |todo| todo[:completed] }.size
  end
end

get '/' do
  redirect '/lists'
end

get '/lists' do
  locals = flash_key
  locals = locals.merge({ lists: session[:lists] })
  erb :lists, locals: locals, layout: :layout
end

get '/lists/new' do
  erb :new_list, locals: { key: :none }, layout: :layout
end

get '/lists/:list_id' do |list_id|
  list = load_list(list_id)
  key = session.key?(:success) ? :success : :none
  erb :list, locals: { list: list, list_id: list_id, key: key }, layout: :layout
end

get '/lists/:list_id/edit' do |list_id|
  list = load_list(list_id)
  erb :edit_list, locals: { list: list, list_id: list_id, key: :none }, layout: :layout
end

delete '/lists/:list_id' do |list_id|
  idx = session[:lists].index { |list| list[:id] == list_id.to_i }
  session[:lists].delete_at(idx)
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = 'The list has been deleted.'
    redirect '/lists'
  end
end

delete '/lists/:list_id/todos/:todo_id' do |list_id, todo_id|
  list = load_list(list_id)
  idx = list[:todos].index { |todo| todo[:id] == todo_id.to_i }
  list[:todos].delete_at(idx)

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    session[:success] = 'The todo has been deleted.'
    redirect "/lists/#{list_id}"
  end
end

patch '/lists/:list_id/todos/:todo_id' do |list_id, todo_id|
  completed_value = params[:completed].to_s == "true"
  list = load_list(list_id)
  list[:todos].find { |todo| todo[:id] == todo_id.to_i }[:completed] = completed_value
  session[:success] = "The todo has been updated."
  redirect "/lists/#{list_id}"
end

patch '/lists/:list_id/todos' do |list_id|
  list = load_list(list_id)
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
    id = create_id(session[:lists])
    session[:lists] << { id: id, name: list_name, todos: [] }
    redirect '/lists'
  end
end

post '/lists/:list_id' do |list_id|
  list_name = params[:list_name].strip
  list = load_list(list_id)
  error = error_for_list_name(list_name)

  if error
    set_flash(:error, error)
    erb :edit_list, locals: { list: list, list_id: list_id, key: :error }, layout: :layout
  else
    message = 'The list has been updated.'
    set_flash(:success, message)
    list[:name] = list_name
    redirect "/lists/#{list_id}"
  end
end

post '/lists/:list_id/todos' do |list_id|
  todo = params[:todo].strip
  list = load_list(list_id)
  error = error_for_todo(todo)

  if error
    session[:error] = error
    erb :list, locals: { list: list, list_id: list_id, key: :error}, layout: :layout
  else
    id = create_id(list[:todos])
    todo_properties = { id: id, name: todo, completed: false }
    list[:todos] << todo_properties
    message = 'The todo was added.'
    set_flash(:success, message)
    redirect "/lists/#{list_id}"
  end
end
