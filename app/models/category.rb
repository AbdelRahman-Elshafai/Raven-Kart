class Category < ApplicationRecord
  has_many :products

  searchable do
    string :name
  end
end
