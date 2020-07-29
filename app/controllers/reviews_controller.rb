class ReviewsController < ApplicationController
    before_action :set_review, only: [:update, :show, :edit, :destroy]

    def index
    end

    def new
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        @review.save
        redirect_to recipe_path(@review.recipe), alert: @review.errors.full_messages.join(', ')
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_review
        @review = Review.find_by_id(params[:id])
    end

    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :recipe_id)
    end

end
