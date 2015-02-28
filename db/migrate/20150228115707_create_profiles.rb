class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nickname
      t.text :bio
      t.date :dob
      t.string :phone
      t.attachment :profile_picture
      t.timestamps null: false
    end
  end
end
