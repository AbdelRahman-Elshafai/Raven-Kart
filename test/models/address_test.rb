require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "should save address" do
    address = Address.new(
      building: addresses(:one).building,
      street: addresses(:one).street,
      district: addresses(:one).district,
      city: addresses(:one).city,
      user_id: 1
    )
    assert address.save
  end
end
