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
  def set_flash(key, message = '')
    session[key] = message
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

get '/lists/:id' do |id|
  list = session[:lists][id.to_i]
  key = session.key?(:success) ? :success : :none
  erb :list, locals: { list: list, id: id, key: key }, layout: :layout
end

get '/lists/:id/edit' do |id|
  list = session[:lists][id.to_i]
  erb :edit_list, locals: { list: list, id: id, key: :none }, layout: :layout
end

delete '/lists/:id' do |id|
  session[:lists].delete_at(id.to_i)
  session[:success] = 'The list has been deleted.'
  redirect '/lists'
end

delete '/lists/:id/todos/:todo_id' do |id, todo_id|
  list = session[:lists][id.to_i]
  list[:todos].delete_at(todo_id.to_i)
  session[:success] = 'The todo has been deleted.'
  redirect "/lists/#{id}"
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

post '/lists/:id' do |id|
  list = session[:lists][id.to_i]
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    set_flash(:error, error)
    erb :edit_list, locals: { list: list, id: id, key: :error }, layout: :layout
  else
    message = 'The list has been updated.'
    set_flash(:success, message)
    session[:lists][id.to_i][:name] = list_name
    redirect "/lists/#{id}"
  end
end

post '/lists/:id/todos' do |id|
  list = session[:lists][id.to_i]
  todo = params[:todo].strip
  error = error_for_todo(todo)

  if error
    session[:error] = error
    erb :list, locals: { list: list, id: id, key: :error}, layout: :layout
  else
    session[:lists][id.to_i][:todos] << { name: todo, completed: false }
    message = 'The todo was added.'
    set_flash(:success, message)
    redirect "/lists/#{id}"
  end
end
