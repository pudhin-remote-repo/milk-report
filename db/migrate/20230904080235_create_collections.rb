class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.date :date
      t.string :shift
      t.string :name
      t.float :liter
      t.float :rate
      t.float :amount

      t.timestamps
    end
  end
end
