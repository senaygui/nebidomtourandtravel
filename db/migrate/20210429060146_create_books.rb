class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :package, index: true
      t.string :customer_full_name
      t.string :email
      t.string :phone_number
      t.string :address
      t.integer :quantity, null: false, default: 1
      t.decimal :total_price, default: 0.0
      t.string :payment_status, default: "Pending" 
      t.decimal :partial_paid_amount, default: 0.0
      t.timestamps
    end
  end
end
