# frozen_string_literal: true

require 'sinatra/base'

# must start Sinatra Extension with module Sinatra
module Sinatra
  # Define helper methods for route handlers and view templates
  module Helpers
    def create_todo_id(todos)
      max = todos.map { |todo| todo[:id] }.max || 0
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

    def load_list(index)
      list = session[:lists][index] if index && session[:lists][index]
      return list if list

      message = 'The specified list was not found.'
      set_flash(:error, message)
      redirect '/lists'
    end

    def set_flash(key, message = '')
      session[key] = message
    end

    def sort_lists(lists, &block)
      complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }

      incomplete_lists.each { |list| yield list, lists.index(list) }
      complete_lists.each { |list| yield list, lists.index(list) }
    end

    def sort_todos(todos, &block)
      complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }

      incomplete_todos.sort_by! { |todo| todo[:id] }
      complete_todos.sort_by! { |todo| todo[:id] }

      incomplete_todos.each { |todo| yield todo }
      complete_todos.each { |todo| yield todo }
    end

    def todos_remaining(list)
      list[:todos].reject { |todo| todo[:completed] }.size
    end
  end

  helpers Helpers
end
