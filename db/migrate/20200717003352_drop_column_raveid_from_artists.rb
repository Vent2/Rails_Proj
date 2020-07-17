class DropColumnRaveidFromArtists < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :rave_id
  end
end
