class RecipesController < ApplicationController
    before_action :set_recipe, only: [:create, :edit, :update, :destroy, :show]
    
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

    private

    def set_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :directions, :main_spirit_id, :user_id)
    end

end
