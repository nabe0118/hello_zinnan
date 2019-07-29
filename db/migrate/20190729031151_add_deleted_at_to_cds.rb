class AddDeletedAtToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :deleted_at, :datetime
    add_index :cds, :deleted_at
  end
end
