require './Classes/teacher'

describe Teacher do
  age = 35
  name = 'Farhan'
  specialization = 'YouTuber'
  parent_permission = true
  let(:teacher) { Teacher.new(age, specialization, name, parent_permission: parent_permission) }

  it 'should have an age' do
    expect(teacher.age).to be(age)
  end

  it 'should have a name' do
    expect(teacher.name).to be(name)
  end

  it 'should have a specialization' do
    expect(teacher.specialization).to be(specialization)
  end

  it 'should have a parent_permission' do
    expect(teacher.parent_permission).to be(true)
  end

  it 'should be able to use services' do
    expect(teacher.can_use_services?).to be(true)
  end
end
