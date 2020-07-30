class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
    def show
        @user = User.find(params[:id])

        #@sorted_bdays = @user.birthdays.sort_by {|bday| bday.dob.day}
        #yebug
        if @user == @current_user
            render :show
        else
            flash[:list_errors] = "Can Only See Your Own Profile!"
            redirect_to '/'
        end

        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            #log_in @user

            flash[:success] = "Welcome to the Birthday Reminder App!"
            redirect_to user_path(@user)
        else
            flash[:list_errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)    
            redirect_to user_path(@user)
        else
            flash[:list_errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/'
    end


    private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
