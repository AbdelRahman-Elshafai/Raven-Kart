class CouponExpireDateJob
  def self.perform
    # Do something later
    coupons = Coupon.all
    coupons.each do |coupon|
    end
  end
end
