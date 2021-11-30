class CreateFarm < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name
      t.integer :acreage
      t.boolean :family_owned

      t.timestamps
    end
  end
end
