require 'cohort_repository'
require 'cohort'

RSpec.describe CohortRepository do
  def reset_cohort_students 
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2'})
    connection.exec(seed_sql)
  end
  before(:each) do
    reset_cohort_students
  end
  it 'should return 3 students for cohort 1' do
    cohort = CohortRepository.new
    expect(cohort.find_with_students('1').size).to eq(3)
  end

  it 'should return 1 students for cohort 2' do
    cohort = CohortRepository.new
    expect(cohort.find_with_students('2').size).to eq(1)
  end
end