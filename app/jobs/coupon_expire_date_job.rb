class CouponExpireDateJob
  def self.perform
    # Do something later
    coupons = Coupon.where(expired: false )
    coupons.each do |coupon|
      if coupon.expiration_date < Time.now.to_date
          coupon.update(expired:true)
      end
    end
  end
end
