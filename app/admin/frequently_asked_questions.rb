ActiveAdmin.register FrequentlyAskedQuestion do

  permit_params :question, :answer
  menu label: "FAQ"
  index do
    selectable_column
    column :question
    column :answer
    column :updated_at
    column :created_at
    actions
  end

  filter :question
  filter :answer
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "FAQ" do
      f.input :question
      f.input :answer
    end
    f.actions
  end

  show title: :question do
    panel 'FAQ' do
      attributes_table_for frequently_asked_question do
        row :question
        row :answer
        row :updated_at
        row :created_at
      end
      
    end
  end
  
end
