class CouponExpireDateJob
  def self.perform
    # Do something later
    ids_array = Array.new
    coupons = Coupon.where(expired: false )
    coupons.each do |coupon|
      if coupon.expiration_date < Time.now.to_date
         ids_array.push(coupon.id)
      end
    end
    Coupon.where(:id => ids_array).update_all(expired: true)
  end
end
