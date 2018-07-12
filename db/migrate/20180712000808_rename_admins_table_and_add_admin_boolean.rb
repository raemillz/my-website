class RenameAdminsTableAndAddAdminBoolean < ActiveRecord::Migration[5.2]
  def change
    rename_table :admins, :users
    add_column :users, :admin, :boolean, default: false
  end
end
