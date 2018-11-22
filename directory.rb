def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete("\n")
  puts "Enter the cohort you are in"
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  @months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  while !name.empty? do
    if cohort == ""
      cohort = "uknown"
    elsif cohort != ""
      until @months.include?(cohort.downcase) == true || cohort == "unknown"
        puts "Enter the cohort you are in"
        cohort = gets.chomp
      end
    end
    # add the student and cohort hash to the array
    students << {name: name, cohort: cohort}
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

def get_students(students)
  month = ""
  until @months.include?(month)
    puts "Choose the cohort you wish to view"
    month = gets.chomp
  end
  cohort_choice = []
  students.each do |student|
    if student[:cohort] == month
      cohort_choice << student[:name]
    end  
  end
  center_puts("The students in the #{month} cohort are:")
  center_puts(cohort_choice.join(", "))
end

def print_header(students)
  center_puts("The students of Villains Academy")
  center_puts("-------------")
end

def print(students)
  if students.count > 0
    students.each.with_index(1) do |student, x|
      center_puts("#{x} #{student[:name]} (#{student[:cohort]} cohort)")
    end
  end
end

def print_footer(students)
  if students.count == 1
    center_puts("Overall, we have #{students.count} great student")
  elsif students.count >= 2
    center_puts("Overall, we have #{students.count} great students")
  else
    center_puts("There are no students at Villains Academy")
  end
end

def center_puts(string)
  puts string.center(50)
end

students = input_students
#nothing happens until we call the methods
get_students(students)

print_header(students)
print(students)
print_footer(students)
