ActiveAdmin.register Partner do

  permit_params :partner_name

  index do
    selectable_column
    column :partner_name
    column :updated_at
    column :created_at
    actions
  end

  filter :partner_name
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Partner Infromation" do
      f.input :partner_name
    end
    f.actions
  end

  show title: :partner_name do
    panel 'Service' do
      attributes_table_for partner do
        row :partner_name
        row :updated_at
        row :created_at
      end
      
    end
    active_admin_comments
  end
  
end
