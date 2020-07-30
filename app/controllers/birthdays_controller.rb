class BirthdaysController < ApplicationController
    before_action :find_birthday, only: [:show, :edit, :update, :destroy]

    def show
        #@time_remaining = birthdaytime - (Time.now)

        birthdaytime = @birthday.dob.change(:year => Time.now.year)
        if birthdaytime < Time.now
            birthdaytime = birthdaytime.next_year(years=1)
        end
        respond_to do |format|
          format.html
            format.ics do
                cal = Icalendar::Calendar.new
                cal.x_wr_calname = 'Awesome Birthday App'
                cal.event do |e|
                    e.dtstart     = birthdaytime
                    e.dtend       = birthdaytime.change(hour: 10)
                    e.summary     = @birthday.giftee_name.capitalize() + "'s Birthday!"
                    e.description = @birthday.reminder.message

                    e.alarm do |a|
                        a.action  = "DISPLAY"
                        a.summary = "Birthday coming up!"
                        a.trigger = "-P1DT0H0M0S" # 1 day before
                    end

                    e.alarm do |a|
                        a.action  = "AUDIO"
                        a.trigger = "-PT15M" #audio alart 15mins
                    end
                end
                cal.publish
                render plain: cal.to_ical
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
        #byebug
        @birthday = Birthday.new(birthday_params)
        @birthday.user_id = current_user.id if current_user
        if @birthday.save
            redirect_to birthday_path(@birthday)
        else
            flash[:list_errors] = @birthday.errors.full_messages
            redirect_to new_birthday_path
        end
    end


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
    #note took out :reminder_id in case this breaks something
    def birthday_params
        params.require(:birthday).permit(:giftee_name, :dob, :user_id, :image)
    end

    def find_birthday
        @birthday = Birthday.find(params[:id])
    end


end
