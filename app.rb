require_relative './Classes/student'
require_relative './Classes/teacher'
require_relative './Classes/book'
require_relative './Classes/rental'
require_relative './MainClasses/create_rental'
require_relative './MainClasses/show_lists'
require_relative 'get_values'
require_relative './MainClasses/show_lists'
require_relative './MainClasses/create_person'
require_relative './MainClasses/create_book'
require_relative './MainClasses/create_rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
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
      when '5' then create_rental(@books, @people, @rentals)
      when '6' then ShowLists.new.list_all_rentals_by_id(@people)
      when '7'
        puts "Thank you for using this app!\n "
        @status = false
      else
        puts "Sorry, you choose a wrong option\n "
      end
    end
  end

  # Create People file
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp

    case input
    when '1' then create_student
    when '2' then create_teacher
    else
      puts 'Sorry, you choose a wrong option'
      create_person
    end
    puts 'Person created successfully'
  end
  
  # Create rental file
  def create_rental
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_selection = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_selection = gets.chomp.to_i
    puts ''
    print('Enter the date of the rental (YYYY-MM-DD): ')
    rental_date = gets.chomp
    rental = Rental.new(rental_date, books[book_selection], people[person_selection])
    rentals << rental
    puts 'Rental created successfully'
  end

  # Lists files
  def list_all_rentals_by_id
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    print 'Enter the id of the person: '
    person_selection = gets.chomp.to_i
    puts 'Rentals:'
    person = people[person_selection]
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
