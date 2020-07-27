class Birthday < ApplicationRecord
    belongs_to :user
    belongs_to :reminder, optional: true
    has_many :gift_birthdays, dependent: :destroy
    has_many :gifts, through: :gift_birthdays, dependent: :destroy
end
