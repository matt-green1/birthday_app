class CreateBirthdays < ActiveRecord::Migration[6.0]
  def change
    create_table :birthdays do |t|
      t.string :giftee_name
      t.datetime :dob
      t.text :message
      t.string :email
      t.string :image_url
      t.integer :user_id
      t.timestamps
    end
  end
end
