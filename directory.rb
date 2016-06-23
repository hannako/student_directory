@students = []

#######################################################################

def input_students
add_more = ''

until add_more == "no"

  puts "Please enter the name of the student"
    name = gets.delete!("\n")
if name == ""
    puts "No students entered"

else
    cohort = ''
    loop do
      puts "Which cohort is #{name} joining?"
      cohort = gets.chomp.capitalize.to_sym
        break if (cohort == :January || cohort == :February || cohort == :March || cohort == :April || cohort == :May || cohort == :June || cohort == :July || cohort == :August || cohort == :September || cohort == :October || cohort == :November || cohort == :December)
        puts "Sorry, I didn't get that. Please write the name of the month in full."
      end

  puts "On campus or online?"

    course = gets.delete!("\n")
    if course == ""
       course = "tbc"
    end


  puts "What is #{name}'s age?"
      age = gets.delete!("\n")
    if age == ""
      age = "tbc"
    end

  puts "Does #{name} have any coding experience?"
      experience = gets.delete!("\n")
      if experience == ""
        experience = "tbc"
      end

  @students << {name: name, cohort: cohort, course: course, age: age, experience: experience}

    loop do
        puts "Would you like to add more students? yes or no?"
        add_more = gets.delete!("\n").downcase
        break if add_more == "yes" || add_more == "no"
        puts "please answer yes or no."
        end

        puts "Now our student count is #{@students.count}"
  end
end

end

################################################################

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

################################################################

def print_students_list #using the each_with_index method
  if @students.empty?
    puts "No data to print"
  else
    width = 30
    puts
    puts "NAME".ljust(width) + "COHORT".center(width) + "DETAILS".rjust(width)
    puts "(month/remote or campus)".center(width.* 3)
    @students.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]}".ljust(width) + "#{student[:cohort]}/ #{student[:course]}.".center(width) +"AGE:#{student[:age]} CODING EXP:#{student[:experience]}".rjust(width)
    end
  end
end


################################################################

def print_by_cohort
selection = []
  puts "Please enter the cohort month."
  month = gets.chomp.capitalize.to_sym

selection << @students.map{|student| student[:name] if student[:cohort] == month}

  puts "COHORT: #{month}"
  puts "These are the enrolled students: #{selection.flatten.join(" ").capitalize}"

end

################################################################

def print_with_until
  n = @students.length
  count = 1
  until count == n
  puts "#{count}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
  count +=1
  end
end

################################################################

def print_footer
  if @students.count == 1
    puts "Overall we have one great student."
  else
  puts "Overall, we have #{@students.count} great students."
  puts "________________________________________________"

end
end

################################################################

def print_selection(letter)
  selection = []
  @students.each do |student|
    first_letter = student[:name][0].downcase
    if first_letter == letter.downcase
        selection << student[:name]
    end
  end
    if selection.length > 0
      puts " Students with names beginning with '#{letter}': #{selection.join(",")}"
    else
      puts "No students with that starting initial sorry."
    end
  end

################################################################

def print_shorts
  shorts = []
  @students.each do |student|
    if student[:name].length < 12
        shorts << student[:name]
    end
  end
    if shorts.length > 0
      puts "Students with short names: #{shorts.join(", ")}. "
    else
      puts "No students with such tiny names."
    end
  end

#######################################################################
#######################################################################
#######################################################################
def interactive_menu
loop do
  print_menu
  process(gets.chomp)
end
end
###########################################################################
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the from students.csv file"
    puts "9. Exit"
end

#########################################################################
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end
########################################################################
def show_students
  print_header
  print_students_list
  print_footer
end
########################################################################
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name],student[:cohort],student[:course],student[:age],student[:experience]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
########################################################################

def load_students
  file = File.open("students.csv","r")
  file.readlines.each do |line|
    name, cohort, course, age, experience = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, course: course, age: age, experience: experience}
  end
  file.close
end
########################################################################
interactive_menu
# print_header
# students = input_students
# print_by_cohort(students)
# print_footer(students)
# #print_selection("k",students)
