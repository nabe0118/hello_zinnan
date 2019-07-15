class CreateAdminMypages < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_mypages do |t|

      t.timestamps
    end
  end
end
