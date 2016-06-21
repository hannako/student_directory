#students =  [
# {name: "Dr Hannibal Lecter", cohort: :november },
# {name: "Darth Vader", cohort: :november },
# {name: "Nurse Ratched",cohort: :november },
# {name: "Michael Corleone",cohort: :november },
# {name: "Alex DeLarge",cohort: :november },
# {name: "The Wicked Witch of the West", cohort: :november },
# {name: "Terminator", cohort: :november },
# {name: "Freddy Krueger",cohort: :november },
# {name: "The Joker", cohort: :november },
# {name: "Joffrey Baratheon", cohort: :november },
# {name: "Norman Bates", cohort: :november }
#]
#########################################################

def input_students
students = []
answer = ''

until add_more = "no"

  puts "Please enter the name of the student"
    name = gets.chomp

cohort = ''
  loop do
    puts "Which cohort is #{name} joining?"
    cohort = gets.chomp.capitalize.to_sym
      break if (cohort == :January || cohort == :February || cohort == :March || cohort == :April || cohort == :May || cohort == :June || cohort == :July || cohort == :August || cohort == :September || cohort == :October || cohort == :November || cohort == :December)
      puts "Sorry, I didn't get that. Please write the name of the month in full."
    end

puts "On campus or online?"

  course = gets.chomp

puts "What is #{name}'s age?"
    age = gets.chomp

puts "Does #{name} have any coding experience?"
    experience = gets.chomp

students << {name: name, cohort: cohort, course: course, age: age, experience: experience}

  puts "Would you like to add more students? yes or no?"
      add_more = gets.chomp.downcase

end
      puts "Now we have #{students.count} students"

students

end


################################################################

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

################################################################

def print_with_each(students)
  if students.empty?
    puts "No data to print"

  else
    width = 30
    puts "Name".ljust(width) + "Cohort".center(width) + "Details".rjust(width)
    students.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]}".ljust(width) + "#{student[:cohort]}, #{student[:course]}.".center(width) +"Age:#{student[:age]} Coding experience:#{student[:experience]}".rjust(width)
  end
end
end

################################################################

def print_with_until(students)
  n = students.length
  count = 1
  until count == n
  puts "#{count}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
  count +=1
  end
end

################################################################


def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end




################################################################

def print_selection(letter,students)
  selection = []
  students.each do |student|
    first = student[:name][0].downcase
    if first == letter.downcase
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

def print_shorts(students)
  shorts = []
  students.each do |student|
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



students = input_students
print_with_each(students)
print_header
print_with_each(students)
print_footer(students)
print_selection("k",students)
