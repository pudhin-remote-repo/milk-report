class CsvImportCollectionsService
  require 'csv'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true)
    csv.each do |row|
      collection_hash = {}
      collection_hash[:date] = parse_date(row["DATE"])
      collection_hash[:shift] = row["SHIFT"]
      collection_hash[:code] = row["CODE"]
      collection_hash[:name] = row["NAME"]
      collection_hash[:liter] = row["QTY"]
      collection_hash[:rate] = row["RATE"]
      collection_hash[:amount] = row["AMOUNT"]

      Collection.create(collection_hash)
    end
  end
  def parse_date(date_str)
    # Parse the date string in dd-mm-yyyy format and convert it to yyyy-mm-dd format
    Date.strptime(date_str, "%d-%m-%Y").strftime("%Y-%m-%d")
  rescue ArgumentError
    # Handle invalid date format
    nil
  end
end