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
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_with_each(students)
  students.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_with_until(students)

end


def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

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
print_header
print_selection("J",students)
print_shorts(students)
print(students)
print_footer(students)
