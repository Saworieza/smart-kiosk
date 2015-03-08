ActiveAdmin.register Kiosk do


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
    f.inputs "Kiosk Details" do
      f.input :unique_id
      f.input :beacon_uuid
      f.input :store, :collection => Store.all.map{|u| [u.address, u.id]}
      f.input :vendor
      f.input :password
    end
    f.actions
  end

end
