require 'csv'
require_relative 'student_grades_class'
require_relative 'grade_summary_class'
require_relative 'grade_reader_class'
require_relative 'write_to_file_class'
require_relative 'final_grade_class'

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