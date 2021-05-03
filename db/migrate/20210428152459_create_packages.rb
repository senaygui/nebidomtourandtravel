class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.belongs_to :tour, index: true
      t.string :package_title, null: false
      t.string :package_description
      t.decimal :price, default: 0.0
      t.timestamps
    end
  end
end
