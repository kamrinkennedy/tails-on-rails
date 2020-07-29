class RecipesController < ApplicationController
    before_action :set_recipe, only: [:new, :edit, :update, :destroy]
    
    def index
        @recipes = Recipe.all
    end

    def new
        check_user
    end

    private

    def set_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :directions, :main_spirit_id, :user_id)
    end

end
