require 'securerandom'
require_relative 'nameable'

class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @nameable = Nameable.new
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @nameable.correct_name(name)
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
capitalizedTrimmedPerson.correct_name
