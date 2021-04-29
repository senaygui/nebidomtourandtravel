ActiveAdmin.register Package do

permit_params :package_title,:package_description,:price, :tour_id
  index do
    selectable_column
    column :package_title
    column "tour", sortable: true do |c|
      c.tour.tour_title
    end
    number_column :price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2
    column :updated_at
    column :created_at
    actions
  end

  filter :tour_id, as: :search_select_filter, url: proc { admin_tours_path },
         fields: [:tour_title, :id], display_name: 'tour_title', minimum_input_length: 2,
         order_by: 'id_asc'
  filter :package_title
  filter :price, as: :numeric_range_filter
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Package Infromation" do
      f.input :package_title
      f.input :tour_id, as: :search_select, url: admin_tours_path,
          fields: [:tour_title, :id], display_name: 'tour_title', minimum_input_length: 2,
          order_by: 'id_asc'
      f.input :price
      f.input :package_description
    end
    f.actions
  end

  show title: :package_title do
    panel 'Package Information' do
      attributes_table_for package do
        row :package_title
        row "tour", sortable: true do |c|
          c.tour.tour_title
        end
        number_row :price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2
        row :package_description
        row :updated_at
        row :created_at
      end
      
    end
  end
  
end
