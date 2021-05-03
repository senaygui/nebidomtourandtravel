class CreatePackageChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :package_checklists do |t|
      t.belongs_to :package, index: true
      t.string :list

      t.timestamps
    end
  end
end
