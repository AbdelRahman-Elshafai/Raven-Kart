class RenameTypeToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :statuses, :type, :name
  end
end
