class AddPositionToBirthday < ActiveRecord::Migration[6.0]
  def change
    add_column :birthdays, :position, :integer
  end
end
