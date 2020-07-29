class Reminder < ApplicationRecord
    belongs_to :birthday
    validates :startdate, :frequency, presence: true
    #Note: frequency already only had 3 choices so no need to validate
    
    #issue if user decides they want to start today. 
    validate :startdate_not_in_past
    def startdate_not_in_past
        if self.startdate <= Date.today
            self.errors.add(:startdate, "Startdate cannot be in the past")
        end
    end

end
