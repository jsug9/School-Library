require_relative '../Classes/student'
require_relative '../Classes/teacher'
require_relative 'get_values'

class CreatePerson
  def set_name
    name_getter
  end

  def set_age
    age_getter
  end

  def permission?
    permission_getter
  end

  def set_specialization
    specialization_getter
  end

  def create_person(people)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      person = Student.new(age: set_age, name: set_name, parent_permission: permission?)
    when '2'
      age = set_age
      name = set_name
      specialization = set_specialization
      person = Teacher.new(age: age, specialization: specialization, name: name)
    else
      puts 'Sorry, you choose a wrong option'
      return
    end

    people << person unless people.include?(person)
    puts 'Person created successfully'
  end
end
