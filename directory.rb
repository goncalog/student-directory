def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  
  puts "Name?"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Cohort?"
    cohort = STDIN.gets.chomp
    students.push({ name: name, cohort: cohort.to_sym })
    puts students.count == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    # get another name from the user
    puts "Name?"
    name = STDIN.gets.chomp
  end
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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students(students)
  if !students.empty? 
    print_header
    print(students)
    print_footer(students)
  end
end

def save_list(students)
  # open the file for writing
  file = File.open("students.csv", "w")
  students.each do |student|
    file.puts "#{student[:name]},#{student[:cohort]}"
  end
  file.close
  puts "List saved"
end

def load_list
  students = []
  filename = !ARGV.empty? ? ARGV.first : "students.csv"
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    students.push({ name: name, cohort: cohort.to_sym })
  end
  file.close
  puts "List loaded"
  students
end

def interactive_menu
  students = []
  loop do
    print_menu()
    selection = STDIN.gets.chomp
    case selection
      when "1" then students = input_students 
      when "2" then show_students(students)
      when "3" then save_list(students)
      when "4" then students = load_list
      when "9" then exit # this will cause the program to terminate
      else puts "I don't know what you meant, try again"
    end
  end
end

#nothing happens until we call the methods
interactive_menu()
