class RenameColumnInProjectsChangingAdminIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :admin_id, :user_id
  end
end
