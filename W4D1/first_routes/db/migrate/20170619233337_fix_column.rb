class FixColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :artwork_shares, :user_id, :viewer_id
  end
end
