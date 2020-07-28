class User < ApplicationRecord
    has_many :birthdays, dependent: :destroy
    has_many :reminders, through: :birthdays, dependent: :destroy

    has_secure_password
end
