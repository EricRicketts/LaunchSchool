# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'rack_session_access'
require 'pry-byebug'
require_relative './config_and_filters/before_filters'
require_relative './config_and_filters/config'
require_relative './helpers/helpers'

# Implement a modular Sinatra apllication
class TodoModular < Sinatra::Base
  use Rack::MethodOverride
  helpers Sinatra::ContentFor
  register Sinatra::Config
  register Sinatra::BeforeFilters
  helpers Sinatra::Helpers

  enable_sessions
  init_session
  enable_escape_html

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
end
