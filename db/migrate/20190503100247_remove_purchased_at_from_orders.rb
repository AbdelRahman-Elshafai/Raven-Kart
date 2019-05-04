class RemovePurchasedAtFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :purchased_at, :datetime
  end
end
