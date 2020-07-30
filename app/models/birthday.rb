class Birthday < ApplicationRecord
    belongs_to :user
    has_one :reminder, dependent: :destroy
    has_many :gifts, dependent: :destroy
    has_one_attached :image

    validates :giftee_name, :dob, presence: true
    validates :giftee_name, uniqueness: true
    validates :image, presence: true

    #validate :real_dob

    # def real_dob
    #     if self.dob >= Date.prev_month(6) 
    #         self.errors.add(:startdate, "Please enter a valid Date of Birth")
    #     end
    # end

    
    #didn't make message presence mandatory so maybe would need to filter out things without messages
    #if we write an automated email helper method
    #note - need to add in image_url and email validations

    #Possible helper methods to refactor

end
