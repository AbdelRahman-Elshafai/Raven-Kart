ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation , :role_id

  index do
    selectable_column
    id_column
    column :email
    column :role_id
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_id, :as => :select, :collection => Role.pluck(:kind , :id)
    end
    f.actions
  end

end