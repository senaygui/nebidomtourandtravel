class AddVideoToTour < ActiveRecord::Migration[5.2]
  def change
  	add_column :tours, :tour_short_video, :string
  end
end
