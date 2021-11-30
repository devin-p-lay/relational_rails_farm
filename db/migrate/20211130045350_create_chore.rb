class CreateChore < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.string :title
      t.integer :duration
      t.boolean :daily
      t.references :farmer, foreign_key: true

      t.timestamps
    end
  end
end
