class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :familiy_name
      t.string :first_name
      t.string :sei
      t.string :mei
      t.string :postal_code
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
