ActiveAdmin.register Contact do

permit_params :full_name,:email,:phone_number,:comment_type,:subject,:message
 menu label: "Contact us"
  index do
    selectable_column
    column :full_name
    column :email
    column :phone_number
    column :comment_type
    column :subject
    column :created_at
    actions
  end

  filter :full_name
  filter :email
  filter :phone_number
  filter :comment_type
  filter :subject
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Contact Us" do
      f.input :full_name
      f.input :email
      f.input :phone_number
      f.input :comment_type, as: :select, collection: ["Testimonial", "Comment", "Question"]
      f.input :subject
      f.input :message
    end
    f.actions
  end

  show title: :full_name do
    panel 'Contact us' do
      attributes_table_for contact do
        row :full_name
        row :email
        row :phone_number
        row :comment_type
        row :subject
        row :message
        row :updated_at
        row :created_at
      end
      
    end
  end
  
end
