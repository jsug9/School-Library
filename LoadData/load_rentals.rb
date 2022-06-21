require 'json'
require_relative '../Classes/rental'

module Rental_Controller
  def load_rentals
    data = []
    file = './data/rentals.json'
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |rental|
        data << Rental.new( rental['date'], rental['book'], rental['person'])
      end
    end
    data
  end

  def save_rentals
    data = []
    @rentals.each do |rental|
      data << {date: rental.date, book: rental.book, person: rental.person}
    end
    File.write('./data/rentals.json', JSON.generate(data))
  end
end