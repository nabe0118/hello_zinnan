class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :familiy_name
      t.string :first_name
      t.string :sei
      t.string :mei
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
