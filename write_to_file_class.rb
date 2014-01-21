require 'csv'

class WriteToFile

  def initialize(formated_grades)
    @formated_grades = formated_grades
  end

  def write_to_file
    CSV.open("final_grades.csv", "wb") do |csv|
      csv << ["Last Name", "First Name", "Final Average", "Final Grade"]
      @formated_grades.final_grades_formatted.each do |person|
        csv << [person[:last_name], person[:first_name], person[:final_average], person[:final_grade]]
      end
    end
  end

end