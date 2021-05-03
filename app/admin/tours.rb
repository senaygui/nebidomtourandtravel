ActiveAdmin.register Tour do
 permit_params :destination_id,:tour_title,:tour_duration,:itinerary,:other_essential_info,:map,:tour_avaliblity_status,:tour_display_on_homepage_priority,:tour_price_range, :desciption, medias: []

  index do
    selectable_column
    column :tour_title
    column "destination", sortable: true do |c|
      c.destination.destination_name
    end 
    column :tour_duration
    column :tour_avaliblity_status
    column :tour_price_range
    column :created_at
    actions
  end
  filter :destination_id, as: :search_select_filter, url: proc { admin_destinations_path },
         fields: [:destination_name, :id], display_name: 'destination_name', minimum_input_length: 2,
         order_by: 'id_asc'
  filter :tour_title
  filter :tour_duration
  filter :tour_avaliblity_status
  filter :tour_display_on_homepage_priority
  filter :tour_price_range
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Tour Infromation" do
      f.input :tour_title
      f.input :destination_id, as: :search_select, url: admin_destinations_path,
          fields: [:destination_name, :id], display_name: 'destination_name', minimum_input_length: 2,
          order_by: 'id_asc'
      f.input :desciption
      f.input :tour_duration
      f.input :itinerary
      f.input :other_essential_info
      f.input :map
      f.input :tour_avaliblity_status
      f.input :tour_display_on_homepage_priority, as: :select, collection: ["Low", "Medium", "High"]
      f.input :tour_price_range
      div class: "file-upload" do
        f.drag_and_drop_file_field :medias
      end
      if f.object.medias.attached?
        f.object.medias.each do |media|
          span do
            if media.variable?
              span image_tag(media, size: '100x100')
            elsif media.previewable?
              span image_tag(media.preview(resize: '100x100'))
            end
            span link_to 'delete', delete_media_admin_library_path(media.id), method: :delete, data: { confirm: 'Are you sure?' }
          end
        end
      end
    end
    f.actions
  end

  show title: :tour_title do
    panel 'Tour Infromation' do
      attributes_table_for tour do
        row :tour_title
        row "destination", sortable: true do |c|
          c.destination.destination_name
        end 
        row :tour_duration
        row :desciption
        row :itinerary
        row :other_essential_info
        row :map
        row :tour_avaliblity_status
        row :tour_display_on_homepage_priority
        row :tour_price_range
        row :updated_at
        row :created_at
        row :medias do
          div do
            tour.medias.each do |media|
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
