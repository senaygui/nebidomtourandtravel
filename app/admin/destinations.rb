ActiveAdmin.register Destination do
  permit_params :destination_name,:destination_description,:country,:city,:map_embed_link, medias: []

  
  
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
              div link_to 'delete', delete_media_admin_destination_path(media.id), method: :delete, data: { confirm: 'Are you sure?' }
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
    redirect_back(fallback_location: edit_admin_destination_path)
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
        row :medias do
          div do
            destination.medias.each do |media|
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
      end
      
    end
  end
  
end
