class SessionPersistence
  attr_accessor :session

  def initialize(session)
    @session = session
    @session[:lists] ||= []
  end

  def all_lists
    session[:lists]
  end

  def create_id(elements)
    max = elements.map { |hsh| hsh[:id] }.max || 0
    max + 1
  end

  def create_new_list(list_name)
    id = create_id(all_lists)
    all_lists << { id: id, name: list_name, todos: [] }
  end

  def find_list(list_id)
    session[:lists].find { |list| list[:id] == list_id.to_i }
  end
end