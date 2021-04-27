ActiveAdmin.register Service do

  permit_params :service_name, :service_description, :created_by, :updated_by

  index do
    selectable_column
    column :service_name
    column :service_description
    column :updated_at
    column :created_at
    actions
  end

  filter :service_name
  filter :service_description
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Service Infromation" do
      f.input :service_name
      f.input :service_description
    end
    f.actions
  end

  show title: :service_name do
    panel 'Service' do
      attributes_table_for service do
        row :service_name
        row :service_description
        row :updated_at
        row :created_at
      end
      
    end
    active_admin_comments
  end
  
end
