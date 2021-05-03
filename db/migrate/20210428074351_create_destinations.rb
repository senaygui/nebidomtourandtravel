class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :destination_name
      t.text :destination_description
      t.string :country
      t.string :city
      t.string :map_embed_link

      t.timestamps
    end
  end
end
