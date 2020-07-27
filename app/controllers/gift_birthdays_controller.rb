class GiftBirthdaysController < ApplicationController
    
    def new
        @gift_birthday = GiftBirthday.new
    end

    def create 
        @gift_birthday = GiftBirthday.create(gift_birthday_params)
        if @gift_birthday.valid?
            #check if redirect works
            redirect_to user_path(@gift_birthday.birthday_id)
        else
            redirect_to new_gift_birthday_path
        end
    end

    def edit
        @gift_birthday = GiftBirthday.find(params[:id])
    end

    def update
        @gift_birthday = GiftBirthday.find(params[:id])
        if @gift_birthday.update(gift_birthday_params)
            #check redirect works 
            redirect_to user_path(@gift_birthday.birthday_id)
        else
            redirect_to edit_gift_birthday_path
        end
    end

    def destroy 
        @gift_birthday = GiftBirthday.find(params[:id])
        @gift_birthday.destroy
        render '/'
    end

private 

    def gift_birthday_params
        params.require(:gift_birthday).permit(:giftidea, :price)
    end

end

