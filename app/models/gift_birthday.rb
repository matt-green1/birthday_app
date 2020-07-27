class GiftBirthday < ApplicationRecord
    belongs_to :birthday
    belongs_to :gift
end
