class CouponExpireDateJob < ApplicationJob
  queue_as :coupon

  def perform(*args)
    # Do something later
    puts "Sleep >>>> #{Time.now}"
  end
end
