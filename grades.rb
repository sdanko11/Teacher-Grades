require_relative 'grade_reader_class'
require_relative 'student_grades_class'
require_relative 'assignment_grade_class'
require_relative 'grade_summary_class'
require_relative 'final_grade_class'
require_relative 'write_to_file_class'


require 'pry'
require 'csv'
binding.pry
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

while command.downcase != 'done'
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
end

 # def student_average(student_name)   
  #   @students_and_scores.student_grades.each do |name|
 #     if name[:name] == student_name
  #         @student_name = name[:name]
  #         puts "#{@student_name}:"
  #         name[:grade].each do |grade|
  #         @student_grades << grade.to_i
  #         end
  #       average_grade = @student_grades.inject(0) {|sum , grade| sum += grade}
  #       grades_count = @student_grades.count
  #       @finial_average = average_grade/grades_count  
  #       puts @finial_average        
  #       end
  #     end
  #   end 

