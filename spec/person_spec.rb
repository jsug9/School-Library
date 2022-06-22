require './Classes/person'
require './Classes/book'
require './Classes/rental'

describe Person do
  age = 20
  name = 'Firdavs'
  parent_permission = true
  let(:person) {Person.new(age, name, parent_permission: parent_permission)}

  it 'should be a person' do
    expect(person).to be_a(Person)
  end

  it 'should have a name' do
    expect(person.name).to eq(name)
  end

  it 'should have an age' do
    expect(person.age).to eq(age)
  end

  it 'should have parent permission' do
    expect(person.parent_permission).to eq(parent_permission)
  end

  it 'should have rentals' do
    empty_rentals_for_person = []
    expect(person.rentals).to eq(empty_rentals_for_person)
  end

  it 'should be able to use services' do
    expect(person.can_use_services?).to be(true)
  end

  it 'should return correct name' do
    person.correct_name
    expect(person.name).to eq(name)
  end

  it 'should be able to add rental to person' do
    book = Book.new('Hamlet', 'William')
    person.add_rental('23/06/2022', book)
    person_rentals = [Rental.new('23/06/2022', book, person)]
    expect(person.rentals.first.person).to eq(person_rentals.first.person)
  end
end