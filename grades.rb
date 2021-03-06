require 'csv'

require_relative 'grade_reader_class'
require_relative 'student_grades_class'
require_relative 'assignment_grade_class'
require_relative 'grade_summary_class'
require_relative 'final_grade_class'
require_relative 'write_to_file_class'

puts "Hi welcome to your grade book?"
puts "To load your grades in type your file name"
file_name = gets.chomp
file = GradeReader.new
raise "#{file_name} does not exist" unless File.exists? file_name
file.load_data(file_name)
puts "What would you like to do?"
puts "To view course analytics type 'course analytics'"
puts "To view student averages type 'view student averages'"
puts "To out put your grades to a file for report cards type 'report cards'"
command = gets.chomp


while true

  if command == 'course analytics'
    grades = GradeSummary.new(file)
    grades.class_averages
    puts "What do you want to do? Type 'done' to exit"
    command = gets.chomp
  end

  if command == "view student averages"
    grades = StudentGrades.new(file)
    grades.get_students_final_average
    final_grades = FinalGrade.new(grades)
    final_grades.print_student_letter_grades
    puts "What do you want to do? Type 'done' to exit"
    command = gets.chomp
  end

  if command == 'report cards'
    grades = StudentGrades.new(file)
    grades.get_students_final_average
    final_grades = FinalGrade.new(grades)
    final_grades.format_grades_for_test_file
    report_card = WriteToFile.new(final_grades)
    report_card.write_to_file
    puts '========================'
    puts "Export Succesful"
    puts '========================'
    puts "What do you want to do? Type 'done' to exit"
    command = gets.chomp
  end

  break if command == 'done'
  
  if ['course analytics', "view student averages", 'report cards', 'done'].any? {|string| command.downcase != string }
    puts "Invalid Command try again, type 'done' to exit"
    command = gets.chomp
  end

end
