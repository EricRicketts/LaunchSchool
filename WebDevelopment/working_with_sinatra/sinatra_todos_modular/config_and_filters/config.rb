require 'sinatra/base'

module Sinatra
  module Config
    def enable_sessions
      configure do
        enable :sessions
        set :session_secret, 'secret'
      end
    end
  end

  register Config
end
