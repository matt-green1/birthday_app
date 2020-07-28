class ApplicationController < ActionController::Base
    before_action :authorized
    
    def authorized
        redirect_to new_user_path unless current_user
    end 

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !current_user.nil?
    end


end
