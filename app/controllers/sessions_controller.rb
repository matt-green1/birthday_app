class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :login]
    def new
    end
      
    def login
        @user = User.find_by(username: params[:session][:username])

        if @user && @user.authenticate(params[:session][:password])
           session[:user_id] = @user.id
           redirect_to user_path(@user)
        else
        flash[:list_errors] = "Username or Password is incorrect"
        redirect_to new_session_path
        end
    end

    def logout
        log_out
        redirect_to '/'
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

end
