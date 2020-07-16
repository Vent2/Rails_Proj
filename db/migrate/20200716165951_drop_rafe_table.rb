class DropRafeTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :raves
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
