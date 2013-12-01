class AssignmentGrade

  def initialize(grade_data)
    @student_grades = grade_data
  end

  def gets_an_asignment_grade(assignment_number)
    @student_grades.student_grades.each do |person|
      if assignment_number == 1
        puts person[:name]
        puts person[:grade][0]
      elsif assignment_number == 2
        puts person[:name]
        puts person[:grade][1]
      elsif assignment_number == 3
        puts person[:name]
        puts person[:grade][2]
      elsif assignment_number == 4
        puts person[:name]
        puts person[:grade][3]
      elsif assignment_number == 5
        puts person[:name]
        puts person[:grade][4]
      else
        puts 'No assingment'
      end
    end
  end
end