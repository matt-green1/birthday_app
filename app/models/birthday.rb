class Birthday < ApplicationRecord
    belongs_to :user
    has_one :reminder, dependent: :destroy
    has_many :gift_birthdays, dependent: :destroy
    has_many :gifts, through: :gift_birthdays, dependent: :destroy

end
