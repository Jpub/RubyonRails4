json.array!(@books) do |book|
  json.extract! book, :isbn, :title, :price, :publish, :published, :cd
  json.url book_url(book, format: :json)
end
