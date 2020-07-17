class CreateStages < ActiveRecord::Migration[6.0]
  def change
    create_table :stages do |t|
      t.integer :number
      t.references :rave, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
