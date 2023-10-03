class CollectionController < ApplicationController
  def import
    file = params[:file]
    return  redirect_to filter_collection_index_path, alert: 'Select a file for import' if file.nil?
    return redirect_to filter_collection_index_path, alert: 'Only CSV file support' unless file.content_type == "text/csv"

    CsvImportCollectionsService.new.call(file)
    redirect_to collection_index_path, notice: 'File Imported'
  end
  def index
    from_date = params[:from_date]
    to_date = params[:to_date]
    code = params[:code]
    @collections = Collection.created_between(from_date, to_date, code)

  end
  def index_pdf
    @collections = Collection.all.limit(10)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'collections_index', template: 'collection/index.html.erb'
      end
    end
  end

  def delete_all
    Collection.delete_all
    redirect_to root_path, notice: "All collections are deleted"
  end

  def filter
  end
end
