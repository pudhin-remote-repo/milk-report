class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def import
    file = params[:file]
    return redirect_to students_path, notice: 'Only CSV file support' unless file.content_type == "text/csv"

    CsvImportStudentsService.new.call(file)
    redirect_to students_path, notice: 'File Imported'
  end
end
