ActiveAdmin.register Post do
permit_params :post_title, :post_type,:body,:author_name, medias: []

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
      div class: "file-upload" do
        f.drag_and_drop_file_field :medias
      end
      if f.object.medias.attached?
        div class: "uploaded-file" do
          f.object.medias.each do |media|
            div do
              if media.variable?
                span image_tag(media, size: '100x100')
              elsif media.previewable?
                span image_tag(media.preview(resize: '100x100')) 
              end
              div link_to 'delete', delete_media_admin_post_path(media.id), method: :delete, data: { confirm: 'Are you sure?' }
            end
          end
        end
      end
    end
    f.actions
  end
  member_action :delete_media, method: :delete do
    @pic = ActiveStorage::Attachment.find(params[:id])
    @pic.purge_later
    redirect_back(fallback_location: edit_admin_post_path)
  end

  show title: :post_title do
    panel 'post' do
      attributes_table_for post do
        row :post_title
        row :post_type
        row :body
        row :author_name
        row :medias do
          div do
            post.medias.each do |media|
              span do
                if media.image?
                  image_tag url_for(media), size: '200x200'
                else
                  video_tag url_for(media), size: '200x200', controls: ''
                end
              end
            end
          end
        end
        row :updated_at
        row :created_at
      end   
    end
  end
  
end
