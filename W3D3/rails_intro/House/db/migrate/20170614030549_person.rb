class Person < ActiveRecord::Migration[5.0]
  def change
    create_table :person do |t|
      t.string :name
      t.integer :house_id

      t.timestamps
    end
  end
end
