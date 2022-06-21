require 'securerandom'
require_relative './Decorators/nameable'
require_relative './Decorators/capitalize_decorator'
require_relative './Decorators/trimmed_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
