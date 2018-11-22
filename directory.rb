def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Enter the cohort you are in"
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  while !name.empty? do
    if cohort == ""
      cohort = "uknown"
    elsif cohort != ""
      until months.include?(cohort.downcase) == true
        puts "Enter the cohort you are in"
        cohort = gets.chomp
      end
    end
    # add the student and cohort hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    # if a name is entered find out their cohort
    if !name.empty?
      puts "Enter the cohort you are in"
      cohort = gets.chomp
    end
  end
  # return the array of students and cohorts
  students
end

def print_header
  center_puts("The students of Villains Academy")
  center_puts("-------------")
end

def print(students)
  students.each.with_index(1) do |student, x|
    if student[:name].length < 12
      center_puts("#{x} #{student[:name]} (#{student[:cohort]} cohort)")
    end
  end
end

def print_footer(students)
  center_puts("Overall, we have #{students.count} great students")
end

def center_puts(string)
  puts string.center(50)
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)