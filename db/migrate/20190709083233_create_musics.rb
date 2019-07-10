class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.integer :number
      t.string :name
      t.integer :disk_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
