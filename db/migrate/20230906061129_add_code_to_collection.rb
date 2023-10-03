class AddCodeToCollection < ActiveRecord::Migration[6.1]
  def change
    add_column :collections, :code, :integer
  end
end
