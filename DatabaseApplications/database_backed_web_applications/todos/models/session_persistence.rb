class SessionPersistence
  attr_reader :session

  def initialize(session)
    @session = session
    @session[:lists] ||= []
  end

  def all_lists
    session[:lists]
  end

  def find_list(list_id)
    session[:lists].find { |list| list[:id] == list_id.to_i }
  end
end