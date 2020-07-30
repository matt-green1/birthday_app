class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.text :message
      t.integer :birthday_id
      t.timestamps
    end
  end
end
