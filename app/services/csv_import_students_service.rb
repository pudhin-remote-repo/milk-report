class CsvImportStudentsService
  require 'csv'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true)
    csv.each do |row|
      student_hash = {}
      student_hash[:name] = row["Name"]
      student_hash[:phone] = row["Email"]
      Student.create(student_hash)
    end
  end
end