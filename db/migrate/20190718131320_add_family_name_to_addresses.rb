class AddFamilyNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :family_name, :string
  end
end
