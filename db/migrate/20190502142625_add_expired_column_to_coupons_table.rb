class AddExpiredColumnToCouponsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :expired,:boolean, default: 0
  end
end
