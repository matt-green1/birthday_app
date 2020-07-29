class BirthdaysController < ApplicationController
    before_action :find_birthday, only: [:show, :edit, :update, :destroy]

    def show
     #  @reminder = @birthday.reminder_id 
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
    end

    private
    def birthday_params
        params.require(:birthday).permit(:giftee_name, :dob, :email, :message, :image_url, :user_id, :reminder_id, :user_id)
    end

    def find_birthday
        @birthday = Birthday.find(params[:id])
    end
end
