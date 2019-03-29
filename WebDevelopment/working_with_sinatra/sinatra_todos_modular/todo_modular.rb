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
  helpers Sinatra::ContentFor
  register Sinatra::Config
  register Sinatra::BeforeFilters
  helpers Sinatra::Helpers

  enable_sessions
  init_session

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
    erb :list, locals: { list: list, id: id, key: :none }, layout: :layout
  end

  get '/lists/:id/edit' do |id|
    erb :edit_list, locals: { id: id, key: :none }, layout: :layout
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
    list_name = params[:list_name].strip
    error = error_for_list_name(list_name)
    if error
      set_flash(:error, error)
      erb :edit_list, locals: { id: id, key: :error }, layout: :layout
    else
      message = 'The list has been updated.'
      set_flash(:success, message)
      session[:lists][id.to_i][:name] = list_name
      redirect '/lists'
    end
  end
end
