@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  puts "Enter the cohort you are in"
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student and cohort hash to the array
    @students << {name: name, cohort: cohort.capitalize.to_sym}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
    # if a name is entered find out their cohort
    if !name.empty?
      puts "Enter the cohort you are in"
      cohort = gets.chomp
    end
  end
  # return the array of students and cohorts
  @students
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
  # 2. read the input and save it into a variable
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def my_puts(string)
  puts string.center(50)
end

def print_header
  my_puts("The students of Villains Academy")
  my_puts("-------------")
end

def print_students_list
  @students.each.with_index(1) do |student, x|
    my_puts("#{x}. #{student[:name]} (#{student[:cohort]} cohort)")
  end
end

def print_footer
  if @students.count == 1
    my_puts("Overall, we have #{@students.count} great student")
  elsif @students.count > 1
    my_puts("Overall, we have #{@students.count} great students")
  else
    my_puts("There are no students at Villains Academy")
  end
end

interactive_menu
