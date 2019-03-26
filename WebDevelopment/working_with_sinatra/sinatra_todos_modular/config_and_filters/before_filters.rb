require 'sinatra/base'

module Sinatra
  module BeforeFilters
    def init_session
      before do
        session[:lists] ||= []
      end
    end
  end

  register BeforeFilters
end
