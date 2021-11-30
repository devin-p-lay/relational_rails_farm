class CreateAnimal < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.boolean :rescue
      t.references :farm, foreign_key: true

      t.timestamps
    end
  end
end
