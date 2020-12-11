class ReviewsController < ApplicationController
    before_action :current_restaurant, only: [:new, :create, :edit, :update, :destroy]
    before_action :current_review, only: [:edit, :update, :destroy]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.restaurant = @restaurant
        @review.save
        redirect_to restaurant_path(@restaurant)
    end

    def edit
    
    end
    
    def update
        @review.update(review_params)
        redirect_to restaurant_path(@restaurant)
    end

    def destroy
        @review.destroy
        redirect_to restaurant_path(@restaurant)
    end

    private

    def review_params
        params.require(:review).permit(:content, :rating)
    end

    def current_review
        @review = Review.find(params[:id])
    end

    def current_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
