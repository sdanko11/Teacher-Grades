require 'pry'
class GradeSummary

  attr_accessor :student_grades 

  def initialize(student_grades)
    @each_student_grades =[]
    @all_grades = []
    @students_and_scores = student_grades
  end

  def sum(grades)
    grades.inject(0) {|sum, number| sum += number}
  end
  
  def count_grades(grades)
    grades.count
  end

  def class_averages
    @students_and_scores.student_grades.each do |name|
      @each_student_grades.concat(name[:grade])
    end
    @all_grades = @each_student_grades.flatten
    @all_grades.map! do |number|
      number.to_i
    end
    sum_of_all_grades = sum(@all_grades)
    total_grades = count_grades(@all_grades)
    class_average = (sum_of_all_grades/total_grades)
    variences = []
    @all_grades.each do |number|
      varience = (number - class_average)*(number - class_average)
      variences << varience
    end
    
    total_of_variences = sum(variences)
    standard_deviation = (total_of_variences/total_grades)
    puts '==========================='
    puts "Class Min: #{@all_grades.min}"
    puts "Class Max: #{@all_grades.max}"
    puts "Average Class Score: #{class_average}"
    puts "Standard Deviation: #{standard_deviation}"
  end

end