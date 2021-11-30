class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.string :title
      t.integer :duration
      t.boolean :daily

      t.timestamps
    end
  end
end
