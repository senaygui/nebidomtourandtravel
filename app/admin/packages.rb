ActiveAdmin.register Package do

permit_params :package_title,:package_description,:price, :tour_id,package_checklists_attributes: [:id, :list, :_destroy]
  index do
    selectable_column
    column :package_title
    column "tour", sortable: true do |c|
      c.tour.tour_title
    end
    column :price do |pt|
      number_to_currency(pt.price, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2)
    end
    # number_column :price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2
    column :updated_at
    column :created_at
    actions
  end

  filter :tour_id, as: :select, :collection => Tour.pluck(:tour_title, :id),
          order_by: 'id_asc'
  filter :package_title
  filter :price
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Package Infromation" do
      f.input :package_title
      f.input :tour_id, as: :select, :collection => Tour.pluck(:tour_title, :id),
          order_by: 'id_asc'
      f.input :price
      f.input :package_description
      f.has_many :package_checklists, allow_destroy: true, new_record: true, sortable_start: 3 do |a|
          a.input :list
      end
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
        # number_row :price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2
        row :price do |pt|
          number_to_currency(pt.price, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2)
        end
        row :package_description
        row :updated_at
        row :created_at
      end
      
    end
  end

  sidebar "Package Checklist", :only => :show do
    table_for package.package_checklists do

      column "list" do |tag|
        tag.list
      end

    end
  end
  
end
