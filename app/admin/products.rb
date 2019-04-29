ActiveAdmin.register Product do
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
  permit_params :title , :description , :image , :price , :stock , :store_id , :brand_id ,:category_id


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :description
      f.input :image, :as => :file
      f.input :price
      f.input :stock
      f.input :store_id, :as => :select, :collection => Store.pluck(:name , :id)
      f.input :brand_id, :as => :select, :collection => Brand.pluck(:name , :id)
      f.input :category_id, :as => :select, :collection => Category.pluck(:name , :id)
    end
    f.actions
  end

end
