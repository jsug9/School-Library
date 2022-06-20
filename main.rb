#!/usr/bin/env ruby
require_relative 'app'

def main # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  app = App.new

  status = true

  array = [
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

  while status
    array.each {|i| puts i }
    option = gets.chomp

    case option
    when '1' then app.list_all_books
    when '2' then app.list_all_people
    when '3' then app.create_person
    when '4' then app.create_book
    when '5' then app.create_rental
    when '6' then app.list_all_rentals_by_id
    when '7'
      puts "Thank you for using this app!\n "
      status = false
    else
      puts "Sorry, you choose a wrong option\n "
    end
  end
end

main
