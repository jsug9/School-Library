require './Classes/Decorators/capitalize_decorator'
require './Classes/Decorators/nameable'
require './Classes/person'

describe CapitalizeDecorator do
  let(:person) { Person.new(18, 'augusto') }
  let(:capitalize_decorator) { CapitalizeDecorator.new(person) }

  it 'should be a CapitalizeDecorator' do
    expect(capitalize_decorator).to be_a(CapitalizeDecorator)
  end

  it 'has a correct_name method' do
    expect(capitalize_decorator.respond_to?(:correct_name)).to eq(true)
  end

  it 'returns the person name capitalized' do
    expect(capitalize_decorator.correct_name).to eq('Augusto')
  end
end
