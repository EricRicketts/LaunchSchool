# frozen_string_literal: true

require 'sinatra/base'
require_relative '../models/session_persistence'

# must start Sinatra Extension with module Sinatra
module Sinatra
  # define before filters to set global data
  module BeforeFilters
    def init_session
      before do
        @storage = SessionPersistence.new(session)
      end
    end
  end

  register BeforeFilters
end
