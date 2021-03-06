class SneakersController < ApplicationController

    def new
        @sneaker = Sneaker.new
        @sneaker.build_brand
    end
    
    def create
        @sneaker = Sneaker.new(sneaker_params)
        @sneaker.user_id = session[:user_id]
        if @sneaker.save
            redirect_to sneaker_path(@sneaker)
        else
            render :new
        end
    end
    
    def index
        @sneakers = Sneaker.order_by_rating 
    end
    
    def show
        @sneaker = Sneaker.find_by_id(params[:id])
    end
    
    private
    
    def sneaker_params
        params.require(:sneaker).permit(:model, :colorway, :brand_id, brand_attributes: [:name])
    end
end 
