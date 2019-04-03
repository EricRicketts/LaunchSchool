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

    def sort_lists(lists, &block)
      incomplete_lists = {}
      complete_lists = {}

      lists.each.with_index do |list, idx|
        if list_complete?(list)
          complete_lists[list] = idx
        else
          incomplete_lists[list] = idx
        end
      end

      incomplete_lists.each(&block)
      complete_lists.each(&block)
    end

    def sort_todos(todos, &block)
      incomplete_todos = {}
      complete_todos = {}

      todos.each.with_index do |todo, idx|
        if todo[:completed]
          complete_todos[todo] = idx
        else
          incomplete_todos[todo] = idx
        end
      end

      incomplete_todos.each(&block)
      complete_todos.each(&block)
    end

    def todos_remaining(list)
      list[:todos].reject { |todo| todo[:completed] }.size
    end
  end

  helpers Helpers
end
