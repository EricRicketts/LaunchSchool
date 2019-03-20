require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry-byebug'

before do
  @users = Psych.load_file("./data/users.yaml")
  @num_users, @num_interests = count_users_and_interests
end

helpers do
  def get_user_data(current_user)
    @users[current_user.to_sym].values
  end

  def count_users_and_interests
    num_users = @users.keys.count
    num_interests = @users.reduce(0) do |sum, arr|
      sum += arr.last[:interests].count
    end
    [num_users, num_interests]
  end
end

get "/" do
  names = @users.keys
  num_users, num_interests = count_users_and_interests
  erb :home, locals: { names: names.map(&:capitalize) }
end

get "/:name" do
  current_user = params[:name]
  other_users = @users.reject { |k, v| k == current_user.to_sym }.keys.map(&:to_s)
  email, interests = get_user_data(current_user)
  erb :user, locals: { name: current_user.capitalize, email: email,
    interests: interests.join(", "), other_users: other_users }
end
