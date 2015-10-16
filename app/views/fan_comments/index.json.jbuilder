json.array!(@fan_comments) do |fan_comment|
  json.extract! fan_comment, :id, :author_no, :name, :body, :deleted
  json.url fan_comment_url(fan_comment, format: :json)
end
