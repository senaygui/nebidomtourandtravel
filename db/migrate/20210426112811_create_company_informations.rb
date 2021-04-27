class CreateCompanyInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :company_informations do |t|
    	t.string :company_name
    	t.text 	 :about_us
    	t.string :mission
    	t.string :vision
    	t.string :facebook_link
    	t.string :tiktok_link
    	t.string :instagram_link
    	t.string :youtube_link
    	t.string :telegram_link
    	t.string :whatsapp_link
    	t.string :address
    	t.string :alternative_address
    	t.string :phone_number
    	t.string :alternative_phone_number
    	t.string :email
    	t.string :map_embed_link
    	t.string :why_choose_us

      t.timestamps
    end
  end
end
