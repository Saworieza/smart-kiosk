ActiveAdmin.register Vendor do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs "Vendor Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar
    end
    f.actions
  end
end
