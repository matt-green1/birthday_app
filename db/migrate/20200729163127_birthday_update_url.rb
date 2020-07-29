class BirthdayUpdateUrl < ActiveRecord::Migration[6.0]
  def change
    change_column :birthdays, :image_url, :text
  end
end
