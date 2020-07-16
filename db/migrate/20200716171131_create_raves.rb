class CreateRaves < ActiveRecord::Migration[6.0]
  def change
    create_table :raves do |t|
      t.string :name
      t.integer :price
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
