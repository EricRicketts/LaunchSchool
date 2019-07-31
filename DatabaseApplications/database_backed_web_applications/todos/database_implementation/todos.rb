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
class Todos < Sinatra::Base
  use Rack::MethodOverride
  helpers Sinatra::ContentFor
  register Sinatra::Config
  register Sinatra::BeforeFilters
  helpers Sinatra::Helpers

  enable_sessions
  init_session
  enable_escape_html

  # home page displays all lists
  get '/' do
    redirect '/lists'
  end

  # display all lists
  get '/lists' do
    locals = flash_key
    locals = locals.merge({ lists: @storage.all_lists })
    erb :lists, locals: locals, layout: :layout
  end

  # add new list form
  get '/lists/new' do
    erb :new_list, locals: { key: :none }, layout: :layout
  end

  # view a single list
  get '/lists/:list_id' do |list_id|
    list_id = list_id.to_i
    list = load_list(list_id)
    key = session.key?(:success) ? :success : :none
    erb :list, locals: { list: list, list_id: list_id, key: key }, layout: :layout
  end

  get '/lists/:list_id/edit' do |list_id|
    list_id = list_id.to_i
    list = load_list(list_id)
    erb :edit_list, locals: { list: list, list_id: list_id, key: :none }, layout: :layout
  end

  delete '/lists/:list_id' do |list_id|
    list_id = list_id.to_i
    @storage.delete_list(list_id)

    if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
      "/lists"
    else
      session[:success] = 'The list has been deleted.'
      redirect '/lists'
    end
  end

  delete '/lists/:list_id/todos/:todo_id' do |list_id, todo_id|
    list_id, todo_id = list_id.to_i, todo_id.to_i
    @storage.delete_todo_from_list(list_id, todo_id)
    if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
      status 204
    else
      session[:success] = 'The todo has been deleted.'
      redirect "/lists/#{list_id}"
    end
  end

  patch '/lists/:list_id/todos/:todo_id' do |list_id, todo_id|
    list_id, todo_id = list_id.to_i, todo_id.to_i
    completed_value = params[:completed].to_s == "true"
    @storage.update_todo_status(list_id, todo_id, completed_value)

    session[:success] = "The todo has been updated."
    redirect "/lists/#{list_id}"
  end

  patch '/lists/:list_id/todos' do |list_id|
    list_id = list_id.to_i
    @storage.mark_all_todos_as_completed(list_id)
    session[:success] = "All todos have been completed."
    redirect "/lists/#{list_id}"
  end

  # create a new list
  post '/lists' do
    list_name = params[:list_name].strip
    error = error_for_list_name(list_name)

    if error
      set_flash(:error, error)
      erb :new_list, locals: { key: :error }, layout: :layout
    else
      @storage.create_new_list(list_name)
      message = 'The list has been created.'
      set_flash(:success, message)
      redirect '/lists'
    end
  end

  # update a list
  post '/lists/:list_id' do |list_id|
    list_id = list_id.to_i
    list_name = params[:list_name].strip
    list = load_list(list_id)
    error = error_for_list_name(list_name)

    if error
      set_flash(:error, error)
      erb :edit_list, locals: { list: list, list_id: list_id, key: :error }, layout: :layout
    else
      @storage.update_list_name(list_id, list_name)
      message = 'The list has been updated.'
      set_flash(:success, message)
      redirect "/lists/#{list_id}"
    end
  end

  post '/lists/:list_id/todos' do |list_id|
    list_id = list_id.to_i
    todo_name = params[:todo].strip
    list = load_list(list_id)
    error = error_for_todo(todo_name)

    if error
      session[:error] = error
      erb :list, locals: { list: list, list_id: list_id, key: :error}, layout: :layout
    else
      @storage.create_new_todo(list_id, todo_name)
      message = 'The todo was added.'
      set_flash(:success, message)
      redirect "/lists/#{list_id}"
    end
  end
end
