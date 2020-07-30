class StaticController < ApplicationController
    skip_before_action :authorized, only: [:index]
    before_action :current_user

    def index
    end

end
