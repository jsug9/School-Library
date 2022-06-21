require_relative './MainClasses/show_lists'
require_relative './MainClasses/create_person'
require_relative './MainClasses/create_book'
require_relative './MainClasses/create_rental'
require_relative './LoadData/load_people'
require_relative './LoadData/load_books'
require_relative './LoadData/load_rentals'

class App
  include PeopleController
  include Rental_Controller
  include BooksController
  attr_accessor :books, :people, :rentals

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
    @status = true
    @welcome_message = [
      "Welcome to School Library App!\n ",
      'Please choose an option by entering a number:',
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
  end

  def run # rubocop:disable Metrics/CyclomaticComplexity
    while @status
      @welcome_message.each { |i| puts i }
      option = gets.chomp

      case option
      when '1' then ShowLists.new.list_all_books(@books)
      when '2' then ShowLists.new.list_all_people(@people)
      when '3' then CreatePerson.new.create_person(@people)
      when '4' then CreateBook.new.create_book(@books)
      when '5' then CreateRental.new.create_rental(@books, @people, @rentals)
      when '6' then ShowLists.new.list_all_rentals_by_id(@people)
      when '7'
        puts "Thank you for using this app!\n "
        @status = false
        save_people
        save_books
        save_rentals
      else
        puts "Sorry, you choose a wrong option\n "
      end
    end
  end
end
