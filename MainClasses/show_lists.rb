class ShowLists
  def list_all_books(books)
    books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end
end
