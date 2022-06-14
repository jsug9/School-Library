require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(person)
    super
    @person = person
  end

  def correct_name
    @person.correct_name
  end
end
