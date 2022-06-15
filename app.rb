require_relative './Classes/student'
require_relative './Classes/teacher'
require_relative './Classes/book'
require_relative './Classes/rental'

class App
  attr_reader :books, :people, :rentals

  def initialize(books = [], people = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end
end
