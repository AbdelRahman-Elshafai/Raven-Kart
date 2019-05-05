ActiveAdmin.register User, as: "Assign Buyers To Sellers" do

  permit_params :role_id ,
                store_attribute: [:id , :name, :summary]

  actions :all, :except => [:new]


  index do
    selectable_column
    id_column
    column :name
    column :email
    column :address
    column :role_id
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs  do
      f.input :name
      f.input :role_id, :as => :select, :collection => Role.pluck(:kind , :id)
    end
    f.actions
  end

end
