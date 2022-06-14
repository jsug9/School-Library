require 'securerandom'
require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmed_decorator'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

person = Person.new(22, 'maximilianus')
puts person.name
# => maximilianus

capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
# => Maximilianus

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name
# => Maximilian
