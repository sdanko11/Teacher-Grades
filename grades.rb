
require 'pry'
require 'csv'

class GradeReader

  attr_accessor :student_grades

  def initialize    
    @student_grades = []
  end

  def load_data(file_name)
    raise "#{file_name} does not exist" unless File.exists? file_name
    CSV.foreach(file_name, headers: true) do |row|
      students ={}
      row['person']
      row['grades']
      students = {name: row['person'], grade: row['grades'].split(' ')}  
       @student_grades << students
    end
  end

end

class GradeSummary

  attr_accessor :student_grades 

  def initialize(student_grades)
    @each_student_grades =[]
    @all_grades = []
    @students_and_scores = student_grades
  end
  
  def student_averages
    @students_and_scores.student_grades.each do |name|
    @each_student_grades.concat(name[:grade])
    end
    @all_grades = @each_student_grades.flatten
    @all_grades.map! do |number|
    number.to_i
    end
    sum_of_all_grades = @all_grades.inject(0) {|sum, number| sum += number}
    total_grades = @all_grades.count
    binding.pry
    class_average = (sum_of_all_grades/total_grades)
    puts "Class Min: #{@all_grades.min}"
    puts "Class Max: #{@all_grades.max}"
    puts "Average Class Score: #{class_average}"
    #gets standard diviation
  end
end


class StudentGrades
  
  def initialize(student_data)
      @students_and_scores = student_data
      @finial_average = nil
      @student_name = nil
      @student_grades = []
  end

  def student_names_with_test_scores
    @students_and_scores.student_grades.each do |name|
      puts "Name: #{name[:name]}" 
      puts "Grades: #{name[:grade].join(',')}"
    end
  end

  def student_average(student_name)
    @students_and_scores.student_grades.each do |name|
      if name[:name] == student_name
          @student_name = name[:name]
          puts "#{@student_name}:"
          name[:grade].each do |grade|
            @student_grades << grade.to_i
          end       
        end
      end
      average_grade = @student_grades.inject(0) {|sum, grade| sum += grade}
      grades_count = @student_grades.count
      @finial_average = average_grade/grades_count  
      puts @finial_average
    end 

end

# class StudentName

#   def initialize(student_data, student_name)


binding.pry

