class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.datetime :startdate
      t.string :frequency

      t.timestamps
    end
  end
end