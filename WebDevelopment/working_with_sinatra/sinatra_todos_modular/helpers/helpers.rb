# frozen_string_literal: true

require 'sinatra/base'

# must start Sinatra Extension with module Sinatra
module Sinatra
  # Define helper methods for route handlers and view templates
  module Helpers
    def set_flash(key = :none, message = '')
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

    def list_class(list)
      "complete" if list_complete?(list)
    end

    def list_complete?(list)
      list[:todos].size > 0 && list[:todos].all? { |todo| todo[:completed] }
    end

    def list_status(list)
      total = list[:todos].size
      not_complete = list[:todos].reject { |todo| todo[:completed] }.size
      "#{not_complete}/#{total}"
    end
  end

  helpers Helpers
end
