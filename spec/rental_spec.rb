require './Classes/person'
require './Classes/book'
require './Classes/rental'

describe Rental do
  let(:person) { Person.new(22, 'maximilianus') }
  let(:book) { Book.new('The Hobbit', 'J.R.R. Tolkien') }
  let(:rental) { Rental.new('2022-01-01', book, person) }

  it 'should be a Rental' do
    expect(rental).to be_a(Rental)
  end

  it 'has a date' do
    expect(rental.date).to eq('2022-01-01')
  end

  it 'has a book' do
    expect(rental.book).to eq(book)
  end

  it 'has a person' do
    expect(rental.person).to eq(person)
  end

  it 'has a person rentals' do
    expect(person.rentals).to eq([rental])
  end

  it 'has a book rentals' do
    expect(book.rentals).to eq([rental])
  end
end
