class Reminder < ApplicationRecord
    has_many :birthdays
    has_many :users, through: :birthdays
end
