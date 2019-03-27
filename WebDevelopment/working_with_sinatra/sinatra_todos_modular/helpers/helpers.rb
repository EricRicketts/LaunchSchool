require 'sinatra/base'

module Sinatra
  module Helpers
    def set_flash(key=:none, message="")
      session[key] = message
    end
  end

  helpers Helpers
end
