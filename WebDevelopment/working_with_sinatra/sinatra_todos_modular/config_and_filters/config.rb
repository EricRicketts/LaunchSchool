require 'sinatra/base'

module Sinatra
  module Config
    def enable_sessions
      configure do
        enable :sessions
        use RackSessionAccess::Middleware if ENV['APP_ENV'] == 'test'
        set :session_secret, 'secret'
      end
    end
  end

  register Config
end
