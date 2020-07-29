class Gift < ApplicationRecord
    belongs_to :birthday

    validates :giftidea, :price, presence: true
    validates :price, numericality: {greater_than: 0}

    validate :consider_charity

    def consider_charity
        if self.price.to_i > 1000000
            self.errors.add(:price, "You're very generous! Please consider donating to charity instead. :)")
        end
    end

end
