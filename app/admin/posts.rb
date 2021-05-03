ActiveAdmin.register Post do
permit_params :post_title, :post_type,:body,:author_name

  index do
    selectable_column
    column :post_title
    column :post_type
    column :body
    column :author_name
    column :created_at
    actions
  end

  filter :post_type
  filter :body
  filter :author_name
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Post Information" do
      f.input :post_title
      f.input :post_type, as: :select, collection: ["blog", "news"]
      f.input :body
      f.input :author_name
    end
    f.actions
  end

  show title: :post_title do
    panel 'post' do
      attributes_table_for post do
        row :post_title
        row :post_type
        row :body
        row :author_name
        row :updated_at
        row :created_at
      end   
    end
  end
  
end
