# file: app.rb

require_relative './lib/cohort_repository'
require_relative './lib/database_connection'

class Application
  def initialize(database_name, io, cohort_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @cohort_repository = cohort_repository
  end

  def run
    result = @cohort_repository.find_with_students('1')
    result.students.each do |record|

      puts "#{result.name} - #{record.name}"
    end
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'student_directory_2',
    Kernel,
    CohortRepository.new
  )
  app.run
end