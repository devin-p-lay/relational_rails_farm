class CreateFarmer < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers do |t|
      t.string :name
      t.integer :age
      t.boolean :full_time

      t.timestamps
    end
  end
end
