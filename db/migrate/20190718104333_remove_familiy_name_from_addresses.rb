class RemoveFamiliyNameFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :familiy_name, :string
  end
end
