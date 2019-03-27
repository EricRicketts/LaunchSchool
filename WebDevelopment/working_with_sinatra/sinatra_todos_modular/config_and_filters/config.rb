# frozen_string_literal: true

require 'sinatra/base'

# must start Sinatra Extension with module Sinatra
module Sinatra
  # configuration decisions
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
