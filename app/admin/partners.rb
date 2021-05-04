ActiveAdmin.register Partner do

  permit_params :partner_name, :image

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
      div class: "file-upload" do
        f.drag_and_drop_file_field :image, accept: 'image/png, image/jpeg, image/gif, image/tiff'
      end
      if f.object.image.attached?
        div class: "uploaded-file" do
          span image_tag(partner.image, size: '100x100')
          div link_to 'delete', delete_image_admin_partner_path(object.image.id), method: :delete, data: { confirm: 'Are you sure?' }
        end
      end

    end
    f.actions
  end

  member_action :delete_image, method: :delete do
    @pic = ActiveStorage::Attachment.find(params[:id])
    @pic.purge_later
    redirect_back(fallback_location: edit_admin_partner_path)
  end

  show title: :partner_name do
    panel 'Partner' do
      attributes_table_for partner do
        row :partner_name
        row :updated_at
        row :created_at
        row :image do |im|
          image_tag url_for(im.image), size: '100x100'
        end
      end
      
    end
    active_admin_comments
  end
  
end
