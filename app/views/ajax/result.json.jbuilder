json.array!(@books) do |book|
  json.extract! book, :isbn, :title
end
