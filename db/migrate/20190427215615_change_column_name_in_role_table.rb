class ChangeColumnNameInRoleTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :roles, :type, :kind
  end
end
