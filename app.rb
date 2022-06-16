require_relative './Classes/student'
require_relative './Classes/teacher'
require_relative './Classes/book'
require_relative './Classes/rental'
require_relative 'get_values'

class App
  attr_reader :books, :people, :rentals

  def initialize(books = [], people = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def list_all_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

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
    puts 'Person created successfully'
  end

  def create_teacher
    age = age_getter
    name = name_getter
    specialization = specialization_getter
    teacher = Teacher.new(age, specialization, name)
    people << teacher unless @people.include?(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book unless @books.include?(book)
    puts 'Book created successfully'
    main_menu
  end

  def create_rental
    puts 'Select a book from the following list by number (not id)'
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_selection = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number)'
    people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_selection = gets.chomp.to_i
    puts ''
    print('Enter the date of the rental (YYYY-MM-DD): ')
    rental_date = gets.chomp
    rentals << Rental.new(books[book_selection], people[person_selection], rental_date)
    puts 'Rental created successfully'
    main_menu
  end

  
end
