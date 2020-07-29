class BirthdaysController < ApplicationController
    before_action :find_birthday, only: [:show, :edit, :update, :destroy]
 #   $bdaygif_array = ["bday1.gif", "bday2.gif", "bday3.gif", "bday4.gif", "bday5.gif", "bday6.gif", "bday7.gif"]
    $test_img = ["bdaypic1.jpg"]

    def show
        respond_to do |format|
          format.html
          format.ics do
            cal = Icalendar::Calendar.new           
                event = Icalendar::Event.new
                event.dtstart = @birthday.starts_at
                event.dtend = @birthday.ends_at  
                event.summary = @birthday.title
                cal.add_event(event)            
                cal.publish
                render :text =>  cal.to_ical
                byebug
          end
        end
    end

    
    def index
        @birthdays = Birthday.all
    end

    def new
        @birthday = Birthday.new
    end

    def create
        @birthday = Birthday.new(birthday_params)
        @birthday.user_id = current_user.id if current_user
    #    @birthday.image_url = $bdaygif_array.sample
        @birthday.image_url = $test_img.sample
        if @birthday.save
            redirect_to birthday_path(@birthday)
        else
            flash[:list_errors] = @birthday.errors.full_messages
            redirect_to new_birthday_path
        end
    end

    #might need an extra variable here
    def edit
    end

    def update
        if birthday_params.reminder_id.empty? 
            birthday_params.reminder_id = nil
        end

        if @birthday.update(birthday_params)
            redirect_to birthday_path(@birthday)
        else
            flash[:list_errors] = @birthday.errors.full_messages
            redirect_to edit_birthday_path
        end
    end

    def destroy
        @birthday.destroy
        redirect_back(fallback_location: user_path(current_user))
    end


    private
    def birthday_params
        params.require(:birthday).permit(:giftee_name, :dob, :email, :message, :image_url, :user_id, :reminder_id, :user_id)
    end

    def find_birthday
        @birthday = Birthday.find(params[:id])
    end


end
