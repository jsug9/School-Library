require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end

book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
puts book.title
# => The Great Gatsby
