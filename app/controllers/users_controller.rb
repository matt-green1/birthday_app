class UsersController < ApplicationController
  before_action :user_find, only: [:edit, :update, :destroy]

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            log_in @user
            flash[:success] = "Welcome to the PhotoView!"
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)    
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path
        end
    end

    def destroy
        @user.destroy
        render '/'
    end


private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def user_find
        @user = User.find.params[:id]
    end

end
