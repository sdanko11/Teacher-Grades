class FinalGrade

  attr_reader :final_grades_formatted

  def initialize(students_with_averages)
    @each_student_averages = students_with_averages
    @final_grades_formatted = []
  end

  def print_student_letter_grades
    @each_student_averages.students_with_final_average.each do |person|
      puts '======================'
      puts person.keys
      person.values.each do |grade|
        if grade >= 90
          puts "Grade: A"
          puts "Final Average: #{person.values.join}"
          puts '======================'
        elsif grade >= 80 && grade < 90
          puts "Grade: B"
          puts "Final Average: #{person.values.join}"
          puts '======================'
        elsif grade >= 70 && grade < 80
          puts 'Grade: C'
          puts "Final Average: #{person.values.join}"
          puts '======================'
        elsif grade >= 60 && grade < 70
          puts 'Grade: D'
          puts "Final Average: #{person.values.join}"
          puts '======================'
        else puts 'Grade: F'
          puts "Final Average: #{person.values.join}"
          puts '======================'
        end
      end
    end
  end

  def format_grades_for_test_file
    @each_student_averages.students_with_final_average.each do |person|
      grades = {}
      person.values.each do |grade|
        if grade >= 90
          name = person.keys[0].join(' ').split
          grades = {first_name: name[0], last_name: name[1], final_average: person.values, final_grade: 'A'}
          @final_grades_formatted << grades
        elsif grade >= 80 && grade < 90
          name = person.keys[0].join(' ').split
          grades = {first_name: name[0], last_name: name[1], final_average: person.values, final_grade: 'B'}
         @final_grades_formatted << grades
        elsif grade >= 70 && grade < 80 
          name = person.keys[0].join(' ').split
          grades = {first_name: name[0], last_name: name[1], final_average: person.values, final_grade: 'C'}
          @final_grades_formatted << grades
        elsif grade >= 60 && grade < 70
          name = person.keys[0].join(' ').split
          grades = {first_name: name[0], last_name: name[1], final_average: person.values, final_grade: 'D'}
          @final_grades_formatted << grades
        else name = person.keys[0].join(' ').split
          grades = {first_name: name[0], last_name: name[1], final_average: person.values, final_grade: 'F'}
          @final_grades_formatted << grades
        end
      end
    end
  end
end