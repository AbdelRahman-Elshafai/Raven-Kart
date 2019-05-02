ActiveAdmin.register Coupon do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :name ,:expiration_date ,:usage_limit ,:deduction_type ,:deduction_amount

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :expiration_date
      f.input :usage_limit
      f.input :deduction_type
      f.input :deduction_amount
    end
    f.actions
  end
end
