require_relative '../Classes/book'

class CreateBook
  def title_getter
    print 'Title: '
    gets.chomp
  end

  def author_getter
    print 'Author: '
    gets.chomp
  end

  def create_book(books)
    book = Book.new(title_getter, author_getter)
    books << book unless books.include?(book)
    puts 'Book created successfully'
  end
end
