require_relative './Classes/student'
require_relative './Classes/teacher'
require_relative './Classes/book'
require_relative './Classes/rental'
require_relative './MainClasses/create_rental'
require_relative 'get_values'

class App
  attr_reader :books, :people, :rentals

  # Remove unnecessary parameters
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
      when '2' then list_all_people
      when '1' then list_all_books
      when '3' then create_person
      when '4' then create_book
      when '5' then create_rental(@books, @people, @rentals)
      when '6' then list_all_rentals_by_id
      when '7'
        puts "Thank you for using this app!\n "
        @status = false
      else
        puts "Sorry, you choose a wrong option\n "
      end
    end
  end

  # Lists files
  def list_all_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
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

  def create_student
    age = age_getter
    name = name_getter
    parent_permission = permission_getter
    student = Student.new(age, name, parent_permission: parent_permission)
    people << student unless @people.include?(student)
  end

  def create_teacher
    age = age_getter
    name = name_getter
    specialization = specialization_getter
    teacher = Teacher.new(age, specialization, name)
    people << teacher unless @people.include?(teacher)
  end

  # Create books file
  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    books << book unless @books.include?(book)
    puts 'Book created successfully'
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
