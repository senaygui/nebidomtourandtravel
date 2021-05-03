class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.string :post_title
      t.string :post_type
      t.text :body
      t.string :author_name

      t.timestamps
    end
  end
end
