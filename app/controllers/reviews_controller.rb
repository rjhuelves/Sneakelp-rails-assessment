class ReviewsController < ApplicationController
    def new
        if @sneaker = Sneaker.find_by_id(params[:sneaker_id])
            @review = @sneaker.reviews.build
        else
            @review = Review.new
        end 
    end 

    def index 
    end 

    private 
    
    def review_params 
        params.require(:review).permit(:sneaker_id, :rating, :title, :content)
    end 
end
