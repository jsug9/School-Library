require './Classes/classroom'

describe Classroom do
  label = 'Classroom 1'
  name = 'John'
  age = '11'

  let(:classroom) { Classroom.new(label) }
  let(:student) { Student.new(name, age) }

  it 'should be a classroom' do
    expect(classroom).to be_a(Classroom)
  end

  it 'should have a label' do
    expect(classroom.label).to eq(label)
  end

  it 'should have a list of students' do
    expect(classroom.students).to eq([])
  end

  it 'should add a student to the list' do
    classroom.add_student(student)
    expect(classroom.students).to eq([student])
  end

  it 'should not add a student to the list if it already exists' do
    classroom.add_student(student)
    classroom.add_student(student)
    expect(classroom.students).to eq([student])
  end
end
