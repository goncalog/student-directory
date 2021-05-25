def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []

  # get the first name
  puts "Name?"
  name = gets.chomp
  while !name.empty? do
    puts "Cohort?"
    cohort = gets.chomp
    # add the student hash to the array
    students.push({ name: name, cohort: cohort.to_sym })
    puts students.count == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    # get another name from the user
    puts "Name?"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  cohorts = students.map { |student| student[:cohort] }.uniq
  cohorts.each do |cohort| 
    students.each_with_index do |student, index| 
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:cohort] == cohort
      # puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      # puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].chr == 'D'
      # puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
if !students.empty? 
  print_header
  print(students)
  print_footer(students)
end