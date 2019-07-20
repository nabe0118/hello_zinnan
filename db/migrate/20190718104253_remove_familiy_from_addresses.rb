class RemoveFamiliyFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :familiy, :string
  end
end
