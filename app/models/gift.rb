class Gift < ApplicationRecord
    has_many :gift_birthdays, dependent: :destroy
    has_many :birthdays, through: :gift_birthdays

    validates :giftidea, :price, presence: true
    validates :price, numericality: {greater_than: 0}

    validate :consider_charity

    def consider_charity
        if self.price > 10000
            self.errors.add(:price, "You're very generous! Please consider donating to charity instead. :)")
        end
    end

end
