class ReviewsController < ApplicationController
    def new
        if @sneaker = Sneaker.find_by_id(params[:sneaker_id])
            @review = @sneaker.reviews.build
        else
            @review = Review.new
        end 
    end 

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to rewview_path(@review)
        else
            flash[:errors] = @review.errors.full_messages 
            render :new 
        end 
    end 

    def index 
    end 

    private 
    
    def review_params 
        params.require(:review).permit(:sneaker_id, :rating, :title, :content)
    end 
end
