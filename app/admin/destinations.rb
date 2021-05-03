ActiveAdmin.register Destination do
  permit_params :destination_name,:destination_description,:country,:city,:map_embed_link
  
  index do
    selectable_column
    column :destination_name
    column "Overview" do |o|
      o.destination_description
    end
    column :country
    column :city
    column :created_at
    actions
  end

  filter :destination_name
  filter :destination_description
  filter :country
  filter :city
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Destination Information" do
      f.input :destination_name
      f.input :destination_description
      f.input :country
      f.input :city
      f.input :map_embed_link
    end
    f.actions
  end

  show title: :destination_name do
    panel 'Destination Information' do
      attributes_table_for destination do
        row :destination_name
        row :destination_description
        row :country, as: :select
        row :city
        row :map_embed_link
        row :updated_at
        row :created_at
      end
      
    end
  end
  
end
