class RemindersController < ApplicationController
    before_action :reminder_find, only: [:edit, :update, :destroy]

    def new
        @reminder = Reminder.new
        @frequencies = ["Bi-weekly", "Weekly", "Monthly"]
    end

    def create
        @reminder = Reminder.create(reminder_params)
        if @reminder.valid?
            redirect_to birthday_path(@reminder.birthday)
        else
            flash[:list_errors] = @reminder.errors.full_messages
            redirect_to new_reminder_path
        end
    end

    def destroy
        @reminder.destroy
        redirect_back(fallback_location: user_path)
    end

    private
    def reminder_params
        params.require(:reminder).permit(:startdate, :frequency, :birthday_id)
    end

    def find_reminder
        @reminder = Reminder.find(params[:id])
    end

end
