class ApplicationController < ActionController::Base
    before_action :authorized
    layout "application"
    
    def authorized
        redirect_to new_user_path unless current_user
    end 

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
