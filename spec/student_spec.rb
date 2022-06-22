require './Classes/student'

describe Student do
  name = 'Have'
  age = 27
  parent_permission = true
  classroom = '9b'
  let(:student) {Student.new(age, name, classroom, parent_permission: parent_permission)}

  it 'should have a name' do
    expect(student.name).to be(name)
  end

  it 'should have an age' do 
    expect(student.age).to be(age)
  end

  it 'should have a classroom' do
    expect(student.classroom).to be(classroom)
  end

  it 'should have a parent permission' do
    expect(student.parent_permission).to be(true)
  end

  it 'should be able to play hooky' do
    expect(student.play_hooky).to match("¯\(ツ)/¯")
  end

  it 'should be added to classroom' do 
    augusto = Student.new(18, 'Augusto')
    augusto.classroom = Classroom.new('1A')
    expect(augusto.classroom.label).to match('1A')
  end
end