class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :cd_id
      t.integer :order_id
      t.integer :uni_price
      t.integer :number

      t.timestamps
    end
  end
end
