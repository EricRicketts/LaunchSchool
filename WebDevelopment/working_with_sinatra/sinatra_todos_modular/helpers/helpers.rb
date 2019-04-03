# frozen_string_literal: true

require 'sinatra/base'

# must start Sinatra Extension with module Sinatra
module Sinatra
  # Define helper methods for route handlers and view templates
  module Helpers
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

    def set_flash(key, message = '')
      session[key] = message
    end

    def sort_lists(session)
      completed_lists, uncompleted_lists = session[:lists].partition do |list|
        list_complete?(list)
      end

      [completed_lists, uncompleted_lists].each do |list_arr|
        list_arr.sort_by! { |list| list[:created_at] }
      end

      uncompleted_lists + completed_lists
    end

    def sort_todos(list)
      completed_todos, uncompleted_todos = list[:todos].partition do |todo|
        todo[:completed]
      end

      list[:todos] = [completed_todos, uncompleted_todos].each do |todo_arr|
        todo_arr.sort_by! { |todo| todo[:created_at] }
      end.reverse.flatten

      list
    end

    def todos_remaining(list)
      list[:todos].reject { |todo| todo[:completed] }.size
    end
  end

  helpers Helpers
end
