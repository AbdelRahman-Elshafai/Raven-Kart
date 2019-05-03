class AddExpiredColumnToCouponsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :expired,:boolean
  end
end
