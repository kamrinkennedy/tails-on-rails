class RecipesController < ApplicationController
    before_action :set_recipe, only: [:edit, :update, :destroy, :show]
    
    def index
        @recipes = Recipe.all
    end

    def new
        check_user
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def show
        @review = Review.new(recipe_id: @recipe.id)
    end
    
    def edit
        verify
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe), notice: "Cocktail successfully updated."
        else
            render :edit
        end
    end

    def destroy
        verify
        @recipe.reviews.each { |r| r.destroy }
        @recipe.destroy
        redirect_to user_path(current_user), notice: "Cocktail successfully removed."
    end

    private

    def verify
        if @recipe.user != current_user
            redirect_to recipe_path(@recipe), alert: "You do not have permission to alter this."
        end
    end

    def set_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :directions, :main_spirit_id, :user_id)
    end

end
