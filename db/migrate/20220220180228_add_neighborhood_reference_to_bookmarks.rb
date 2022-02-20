class AddNeighborhoodReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :neighborhoods
    add_index :bookmarks, :neighborhood_id
    change_column_null :bookmarks, :neighborhood_id, false
  end
end
