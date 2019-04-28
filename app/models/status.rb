class Status < ApplicationRecord
    has_one :order_product
    has_one :order
end
