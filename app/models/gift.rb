class Gift < ApplicationRecord
    has_many :gift_birthdays, dependent: :destroy
    has_many :birthdays, through: :gift_birthdays
end
