json.array!(@authors) do |author|
  json.extract! author, :user_id, :name, :birth, :address, :ctype, :photo
  json.url author_url(author, format: :json)
end
