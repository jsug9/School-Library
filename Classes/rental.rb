class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def addBook(book)
    @book = book
    @book.rentals << self unless @book.rentals.include?(self)
  end

  def addPerson(person)
    @person = person
    @person.rentals.push << self unless @person.rentals.include?(self)
  end
end
