class RemindersController < ApplicationController

    def new
        @reminder = Reminder.new
        @frequencies = ["Bi-weekly", "Weekly", "Monthly"]
    end

    
    def create
        @reminder = Reminder.create(reminder_params)
        if @reminder.valid?
            redirect_to birthday_path(@reminder.birthday)
        else
        end
    end

    def edit
    end

    def update
    end

    private
    def reminder_params
        params.require(:reminder).permit(:startdate, :frequency)
    end

    def find_reminder
        @reminder = Reminder.find(params[:id])
    end

end
