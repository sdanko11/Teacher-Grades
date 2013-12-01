require_relative 'student_grades_class'
require_relative 'grade_summary_class'
require_relative 'grade_reader_class'
require_relative 'write_to_file_class'
require_relative 'final_grade_class'

require 'csv'

class WriteToFile

  def initialize(formated_grades)
    @formated_grades = formated_grades
  end

  def write_to_file
    CSV.open("final_grades.csv", "wb") do |csv|
      csv << ["First Name", "Last Name", "Final Average", "Final Grade"]
    @formated_grades.final_grades_formatted.each do |person|
      csv << [person[:first_name], person[:last_name], person[:final_average], person[:final_grade]]
    end
  end
end

end