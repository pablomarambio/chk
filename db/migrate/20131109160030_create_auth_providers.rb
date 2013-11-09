class CreateAuthProviders < ActiveRecord::Migration
  def change
    create_table :auth_providers do |t|
      t.integer :user_id
      t.string :ap_name
      t.string :ap_uid
      t.string :ap_oa_token
      t.string :ap_oa_secret
      t.text :ap_upicture
      t.text :ap_uprofile
      t.string :ap_uemail
      t.string :ap_uname
      t.text :raw

      t.timestamps
    end
  end
end
