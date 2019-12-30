# frozen_string_literal: true

require 'sinatra/base'

# must start Sinatra Extension with module Sinatra
module Sinatra
  # Define helper methods for route handlers and view templates
  module Helpers
    def error_for_list_name(name)
      if !(1..100).cover?(name.size)
        'List name must be between 1 and 100 characters.'
      elsif @storage.all_lists.any? { |list| list[:name] == name }
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
      list = @storage.find_list(list_id)
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

  helpers Helpers
end
