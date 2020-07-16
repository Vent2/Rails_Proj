class AddUseridToRaves < ActiveRecord::Migration[6.0]
  def change
    add_column :raves, :user_id, :integer
  end
end
