class ProductExistanceValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        record.errors.add(attribute, "product doesn't exist") unless 
            Product.find_by_id(value).present?
    end
end