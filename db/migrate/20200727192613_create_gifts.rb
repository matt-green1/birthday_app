class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :giftidea
      t.integer :price

      t.timestamps
    end
  end
end
