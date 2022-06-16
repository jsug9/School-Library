def age_getter
  puts 'Age: '
  age = gets.chomp

  if age == ''
    puts 'Age cannot be empty'
    age_getter
  end

  if age != age.to_i.to_s
    puts 'Only numbers are allowed'
    age_getter
  end

  if age.to_i.negative? || age.to_i > 120
    puts 'Age must be between 0 and 120'
    age_getter
  end

  age
end

def string_getter(string)
  puts `#{string}:`
  value = gets.chomp

  if value == ''
    puts `#{string} cannot be empty`
    string_getter(string)
  end

  value.capitalize
end

def name_getter
  puts 'Name: '
  name = gets.chomp

  if name == ''
    puts 'Name cannot be empty'
    name_getter
  end

  name.capitalize
end

def specialization_getter
  puts 'Specialization: '
  specialization = gets.chomp

  if specialization == ''
    puts 'Specialization cannot be empty'
    specialization_getter
  end

  specialization.capitalize
end

def permission_getter
  puts 'Has parent permission? (Y/N): '
  parent_permission = gets.chomp

  if parent_permission == ''
    puts 'Parent permission cannot be empty'
    permission_getter
  end

  if parent_permission.downcase != 'y' && parent_permission.downcase != 'n'
    puts 'Only Y or N are allowed'
    permission_getter
  end

  parent_permission.downcase == 'y'
end
