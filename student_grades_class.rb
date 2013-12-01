require_relative 'grade_summary_class.rb'
require_relative 'grade_reader_class.rb'
require_relative 'write_to_file_class.rb'
require_relative 'final_grade_class.rb'
require_relative 'student_grades_class.rb'

require 'csv'

class StudentGrades
  
  attr_reader :students_with_final_average

  def initialize(student_data)
      @students_with_final_average = []
      @students_and_scores = student_data
  end

  def print_student_names_with_test_scores
    @students_and_scores.student_grades.each do |name|
      puts "Name: #{name[:name]}" 
      puts "Grades: #{name[:grade].join(',')}"
    end
  end

  def get_students_final_average
      student_grades = []
      @students_and_scores.student_grades.each do |name|
        all_student_grades = {name[:name] => name[:grade]}
        student_grades << all_student_grades
      end
        student_grades.each do |person|
          person.values.each do |grade|
            grade.map! do |number|
              number.to_i
            end
          end
        end
          student_grades.each do |person|
          person.values.each do |grades|
          sum_of_grades = grades.inject() {|sum, grade| sum += grade}
          grade_count = grades.count
          @@averages = sum_of_grades/grade_count
        end
        student_with_average = {person.keys => @@averages}
        @students_with_final_average << student_with_average
        end
      end
    end