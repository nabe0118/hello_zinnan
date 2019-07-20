class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status
      t.integer :payment_method
      t.string :familiy_name
      t.string :first_name
      t.string :sei
      t.string :mei
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.integer :shipping_fee

      t.timestamps
    end
  end
end
