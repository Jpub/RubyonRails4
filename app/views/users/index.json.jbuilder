json.array!(@users) do |user|
  json.extract! user, :username, :password, :email, :dm, :roles
  json.url user_url(user, format: :json)
end
