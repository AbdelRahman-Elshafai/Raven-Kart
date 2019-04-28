class User < ApplicationRecord
  has_many :addresses 
  has_many :products
  has_many :feedbacks
  has_one :store
  belongs_to :role
end
