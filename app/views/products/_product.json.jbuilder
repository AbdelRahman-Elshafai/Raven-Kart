json.extract! product, :id, :title, :description, :product_category, :product_brand, :created_at, :updated_at
json.url product_url(product, format: :json)
