class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.belongs_to :destination, index: true
      t.string :tour_title
      t.string :desciption
      t.string :tour_duration
      t.text :itinerary
      t.text :other_essential_info
      t.string :map
      t.boolean :tour_avaliblity_status, default: true 
      t.string :tour_display_on_homepage_priority, default: "low" 
      t.string :tour_price_range

      t.timestamps
    end
  end
end
