class CreateGiftBirthdays < ActiveRecord::Migration[6.0]
  def change
    create_table :gift_birthdays do |t|
      t.integer :birthday_id
      t.integer :gift_id

      t.timestamps
    end
  end
end
