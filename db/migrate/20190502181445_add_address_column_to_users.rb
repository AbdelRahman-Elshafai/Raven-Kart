class AddAddressColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string, null: false
  end
end
