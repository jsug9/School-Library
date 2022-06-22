require './Classes/Decorators/base_decorator'
require './Classes/person'

describe BaseDecorator do
  let(:person) { Person.new(18, 'augusto') }
  let(:base_decorator) { BaseDecorator.new(person) }

  it 'should be a base decorator' do
    expect(base_decorator).to be_a(BaseDecorator)
  end

  it 'has a correct_name method' do
    expect(base_decorator.respond_to?(:correct_name)).to eq(true)
  end

  it 'correct_name equals the name of the person' do
    expect(base_decorator.correct_name).to eq(person.name)
  end
end
