class SneakersController < ApplicationController
    def new 
        @sneaker = Sneaker.new
        @sneaker.build_brand
    end 

    private 

    def sneaker_params 
        params.require(:sneaker).permit(:model, :colorway, :brand_id, brand_attributes: [:name])
    end 

end
