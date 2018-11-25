require 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to your chosen file"
  puts "4. Load the list from your chosen file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You have chosen to input students"
    input_students
  when "2"
    puts "You have chosen to show the list"
    show_students
  when "3"
    puts "You have chosen to save the list"
    save_students
  when "4"
    puts "You have chosen to load the students list"
    load_students
  when "9"
    puts "You have chosen to exit"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do
    add_students_to_list({name: @name, cohort: :november})
    puts "Now we have #{@students.count} students"
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def choose_filename
  puts "Which file would you like to use?"
  puts "If left blank, default will be students.csv"
  @filename = STDIN.gets.chomp
  if @filename == ""
    @filename = "students.csv"
  else
    @filename
  end
end

def save_students
  choose_filename
  @students = []
  CSV.open(@filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
end

def load_students(*file)
  choose_filename
  CSV.foreach(@filename) do |row|
    @name = row[0]
    @cohort = row[1]
    add_students_to_list(@name, @cohort)
  end
end

def add_students_to_list(*names)
  @students << {name: @name, cohort: :november}
end

def try_load_students
  if ARGV.first == nil
    filename = "students.csv";
  else
    filename = ARGV.first
  end
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
def add_students_to_list(*names)
  @students << {name: @name, cohort: :november}
end

def try_load_students
  if ARGV.first == nil
    filename = "students.csv"
  else
    filename = ARGV.first
  end
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  end
end

try_load_students
interactive_menu

# exercise 3 - refactoring - can't see too many places to work on at the moment.
# will return post CV writing if I have time!