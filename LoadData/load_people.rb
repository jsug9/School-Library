require 'json'
require './Classes/student'
require './Classes/teacher'

module PeopleController
  def load_people
    data = []
    file = './data/people.json'
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |person|
        if person['class'] == 'Student'
          data.push(Student.new(id: person['id'], name: person['name'], age: person['age'],
                                parent_permission: person['parent_permission']))
        end
        next unless person['class'] == 'Teacher'

        data.push(Teacher.new(id: person['id'], name: person['name'], age: person['age'],
                              parent_permission: person['parent_permission'],
                              specialization: person['specialization']))
      end
    else
      File.write(file, '[]')
    end
    data
  end

  def save_people
    data = []
    @people.each do |person|
      if person.instance_of?(Teacher)
        data.push({ id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission,
                    class: person.class, specialization: person.specialization })
      end
      if person.instance_of?(Student)
        data.push({ id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission,
                    class: person.class })
      end
    end
    File.write('./data/people.json', JSON.generate(data))
  end
end
