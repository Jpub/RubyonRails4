atom_feed do |feed|
  feed.title('최신 도서 정보')
  feed.updated(@books.last.created_at)

  @books.each do |book|
    feed.entry(book,
      url: "http://test.com/#{book.isbn}/",
      published: book.published,
      updated: book.published) do |entry|
      entry.title(book.title)
      entry.content("#{book.publish} #{book.price}원")
      entry.author do |author|
        author.name(book.authors[0].name) if book.authors[0]
      end
    end
  end
end
