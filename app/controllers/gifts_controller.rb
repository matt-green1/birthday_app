class GiftsController < ApplicationController
    
    def new
        @gift = Gift.new
    end

    def create 
        @gift = Gift.create(gift_params)
        if @gift.valid?
            #check if redirect works
            redirect_to user_path(@gift.birthday_id)
        else
            flash[:list_errors] = @birthday.errors.full_messages
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
            redirect_to user_path(@gift.birthday_id)
        else
            redirect_to edit_gift_path
        end
    end

    def destroy 
        @gift = Gift.find(params[:id])
        @gift.destroy
        render '/'
    end

private 

    def gift_params
        params.require(:gift).permit(:giftidea, :price)
    end

end
