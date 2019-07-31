# frozen_string_literal: true

require 'sinatra/base'
require_relative '../models/database_persistence'

# must start Sinatra Extension with module Sinatra
module Sinatra
  # define before filters to set global data
  module BeforeFilters
    def init_session
      before do
        @storage = DatabasePersistence.new
      end
    end
  end

  register BeforeFilters
end
