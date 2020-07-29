class Birthday < ApplicationRecord
    belongs_to :user
    has_one :reminder, dependent: :destroy
    has_many :gift_birthdays, dependent: :destroy
    has_many :gifts, through: :gift_birthdays, dependent: :destroy

    validates :giftee_name, :dob, presence: true
    validates :giftee_name, uniqueness: true
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
    def make_date_pretty(date) 
        date.strftime("%d-%m-%Y")
    end

    def to_icalender
        @event = Birthday.find(params[:id])
        respond_to do |format|
          format.html
          format.ics do
            cal = Icalendar::Calendar.new           
                event = Icalendar::Event.new
                event.dtstart = @event.starts_at
                event.dtend = @event.ends_at  
                event.summary = @event.title
                event.uid = event.url = "#{event_url}"
                cal.add_event(event)            
                cal.publish
                render :text =>  cal.to_ical
          end
        end
    end

end
