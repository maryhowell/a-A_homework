class CreateArtworkShares < ActiveRecord::Migration[5.0]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end

    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :user_id
  end
end
