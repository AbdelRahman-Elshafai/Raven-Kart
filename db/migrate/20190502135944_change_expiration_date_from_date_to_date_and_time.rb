class ChangeExpirationDateFromDateToDateAndTime < ActiveRecord::Migration[5.2]
  def change
    change_column :coupons, :expiration_date , :datetime
  end
end
