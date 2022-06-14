require_relative 'basedecorator'
require_relative 'person'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.upcase
  end
end
