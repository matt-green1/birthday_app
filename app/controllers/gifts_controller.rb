class GiftsController < ApplicationController
    
    def new
        @gift = Gift.new
        @birthdays = current_user.birthdays
    end

    def create 
        @gift = Gift.new(gift_params)
        if @gift.save
            redirect_to birthday_path(@gift.birthday_id)
        else
            flash[:list_errors] = @gift.errors.full_messages
            redirect_to new_gift_path
        end
    end

    def edit
        @gift = Gift.find(params[:id])
    end

    def update
        @gift = Gift.find(params[:id])
        if @gift.update(gift_params)
            #check redirect works 
            redirect_to birthday_path(@gift.birthday_id)
        else
            redirect_to edit_gift_path
        end
    end

    def destroy 
        @gift = Gift.find(params[:id])
        @gift.destroy
        redirect_back(fallback_location: user_path(current_user))
    end

private 

    def gift_params
        params.require(:gift).permit(:giftidea, :price, :birthday_id)
    end

end
