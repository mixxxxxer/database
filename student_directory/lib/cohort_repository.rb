require_relative './cohort'
require_relative './student'
require_relative './database_connection'

class CohortRepository 
  def find_with_students(cohort_id)
    sql = 'SELECT cohorts.id,
                  cohorts.name,
                  cohorts.starting_date,
                  students.id AS student_id,
                  students.name AS student_name,
                  students.cohort_id
          FROM cohorts
          JOIN students ON students.cohort_id = cohorts.id
          WHERE cohorts.id = $1;'

    params = [cohort_id]

    result = DatabaseConnection.exec_params(sql, params)

    cohort = Cohort.new

    cohort.id = result.first['id']
    cohort.name = result.first['name']
    cohort.starting_date = result.first['starting_date']

    result.each do |record|
      student = Student.new
      student.id = record['id']
      student.name = record['student_name']
      student.cohort_id = record['cohort_id']

      cohort.students << student
    end

    return cohort
  end

end