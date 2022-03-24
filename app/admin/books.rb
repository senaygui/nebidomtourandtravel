ActiveAdmin.register Book do

permit_params :package_id,:customer_full_name,:email,:phone_number,:address,:quantity,:total_price, :payment_status, :partial_paid_amount

  index do
    selectable_column
    column :id
    column :customer_full_name
    column "Package", sortable: true do |c|
      c.package.package_title
    end
    column "Tour", sortable: true do |c|
      c.package.tour.tour_title
    end
    column :quantity
    # column :email
    # column :phone_number
    column :payment_status
    # number_column :total_price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2
    column :total_price do |pt|
      number_to_currency(pt.total_price, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2)
    end
    column :created_at
    actions
  end
  filter :id
  filter :package_id, as: :select, :collection => Package.pluck(:package_title, :id),
          order_by: 'id_asc'
  filter :customer_full_name
  filter :email
  filter :phone_number
  filter :address
  filter :quantity
  filter :payment_status
  filter :partial_paid_amount
  filter :total_price
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Booking Infromation" do
      f.input :package_id, as: :select, :collection => Package.pluck(:package_title, :id),
          order_by: 'id_asc'
      f.input :quantity
      f.input :customer_full_name
      f.input :email
      f.input :phone_number
      f.input :address
      f.input :payment_status, as: :select, collection: ["fully paid", "partial paid"]
      f.input :partial_paid_amount
    end
    f.actions
  end

  show title: :customer_full_name do
    panel 'booking Infromation' do
      attributes_table_for book do
        row :id
        row "Package", sortable: true do |c|
          c.package.package_title
        end
        row "Tour", sortable: true do |c|
          c.package.tour.tour_title
        end 
        row :customer_full_name
        row :email
        row :phone_number
        row :quantity
        row :total_price do |pt|
          number_to_currency(pt.total_price, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2)
        end
        # number_row :total_price, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2
        row :payment_status
        row :partial_paid_amount
        row :updated_at
        row :created_at
      end
    end
  end
  
end
