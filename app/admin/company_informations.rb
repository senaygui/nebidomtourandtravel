ActiveAdmin.register CompanyInformation do

  permit_params :company_name,:about_us,:mission,:vision,:facebook_link,:tiktok_link,:instagram_link,:youtube_link,:telegram_link,:whatsapp_link,:address,:alternative_address,:phone_number,:alternative_phone_number,:map_embed_link,:email,:why_choose_us
  
  actions :index, :show, :update, :edit
  
    selectable_column
    column :company_name
    column :email
    column :phone_number
    column :address
    column :created_at
    actions
  end
  filter :company_name
  filter :email
  filter :phone_number
  filter :created_at

  form do |f|
    f.inputs"Company Information" do
      f.input :company_name
      f.input :about_us
      f.input :mission
      f.input :vision
      f.input :why_choose_us
      f.input :phone_number
      f.input :alternative_phone_number
      f.input :address
      f.input :alternative_address
      f.input :map_embed_link
    end
    f.inputs "Social Media Information" do
      f.input :email
      f.input :facebook_link
      f.input :tiktok_link
      f.input :instagram_link
      f.input :youtube_link
      f.input :telegram_link
      f.input :whatsapp_link
    end
    f.actions
  end


  show title: :company_name do
    panel 'Company Information' do
      attributes_table_for company_information do
        row :company_name
        row :about_us
        row :mission
        row :vision
        row :why_choose_us
        row :phone_number
        row :alternative_phone_number
        row :address
        row :alternative_address
        row :map_embed_link
        row :email
        row :facebook_link
        row :tiktok_link
        row :instagram_link
        row :youtube_link
        row :telegram_link
        row :whatsapp_link
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end
  end  
end
