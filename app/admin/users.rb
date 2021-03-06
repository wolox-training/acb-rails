ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :locale
  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :locale
    actions
  end
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :first_name
  filter :last_name
  filter :locale
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :locale
    end
    f.actions
  end
end
