require './Classes/Decorators/trimmed_decorator'
require './Classes/Decorators/nameable'
require './Classes/person'

describe CapitalizeDecorator do
  let(:person) { Person.new(22, 'maximilianus') }
  let(:trimmed_decorator) { TrimmerDecorator.new(person) }

  it 'should be a TrimmedDecorator' do
    expect(trimmed_decorator).to be_a(TrimmerDecorator)
  end

  it 'has a correct_name method' do
    expect(trimmed_decorator.respond_to?(:correct_name)).to eq(true)
  end

  it 'returns the person name trimmed to 10 characters' do
    expect(trimmed_decorator.correct_name).to eq('maximilian')
  end
end
