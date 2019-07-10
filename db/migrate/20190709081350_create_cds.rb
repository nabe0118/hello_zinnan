class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.string :name
      t.integer :price
      t.integer :stock
      t.integer :status,  :default => 0
      t.integer :image_id
      t.integer :label_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
