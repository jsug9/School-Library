require './Classes/Decorators/nameable'

describe Nameable do
  let(:nameable) { Nameable.new }

  it 'has a correct_name method' do
    expect(nameable.respond_to?(:correct_name)).to eq(true)
  end

  it 'must be implemented in a subclass' do
    expect { subject.correct_name }.to raise_error(NotImplementedError)
  end
end
