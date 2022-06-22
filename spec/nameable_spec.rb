require './Classes/Decorators/nameable'

describe Nameable do
  it 'must be implemented in a subclass' do
    expect { subject.correct_name }.to raise_error(NotImplementedError)
  end
end
