require 'sinatra/base'

module Sinatra
  module Helpers
    def set_flash(key=:none, message="")
      session[key] = message
    end

    def error_for_list_name(name)
      if !(1..100).cover?(name.size)
        "List name must be between 1 and 100 characters."
      elsif session[:lists].any? { |list| list[:name] == name }
        "List name must be unique."
      else
        false
      end
    end
  end

  helpers Helpers
end
