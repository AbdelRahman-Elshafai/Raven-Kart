class User < ApplicationRecord
  has_many :addresses, :products
  has_many :feedbacks
  has_one :store
  belongs_to :role
end
