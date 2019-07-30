class SessionPersistence
  attr_accessor :session

  def initialize(session)
    @session = session
    @session[:lists] ||= []
  end

  def all_lists
    session[:lists]
  end

  def create_new_list(list_name)
    id = create_id(all_lists)
    all_lists << { id: id, name: list_name, todos: [] }
  end

  def create_new_todo(list_id, todo_name)
    list = find_list(list_id)
    id = create_id(list[:todos])
    list[:todos] << { id: id, name: todo_name, completed: false }
  end

  def delete_list(list_id)
    idx = all_lists.index { |list| list[:id] == list_id }
    all_lists.delete_at(idx)
  end

  def delete_todo_from_list(list_id, todo_id)
    list = find_list(list_id)
    idx = list[:todos].index { |todo| todo[:id] == todo_id.to_i }
    list[:todos].delete_at(idx)
  end

  def find_list(list_id)
    session[:lists].find { |list| list[:id] == list_id }
  end

  def mark_all_todos_as_completed(list_id)
    list = find_list(list_id)
    list[:todos].each { |todo| todo[:completed] = true }
  end

  def update_list_name(list_id, list_name)
    list = find_list(list_id)
    list[:name] = list_name
  end

  def update_todo_status(list_id, todo_id, status)
    list = find_list(list_id)
    todo = list[:todos].find { |todo| todo[:id] == todo_id.to_i }
    todo[:completed] = status
  end

  private

  def create_id(elements)
    max = elements.map { |hsh| hsh[:id] }.max || 0
    max + 1
  end
end