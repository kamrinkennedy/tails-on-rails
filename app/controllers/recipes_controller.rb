class RecipesController < ApplicationController
    before_action :set_recipe, only: [:edit, :update, :destroy, :show]
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    
    def index
        if params[:main_spirit_id]
            @main_spirit = MainSpirit.find_by_id(params[:main_spirit_id])
        else
            @recipes = Recipe.all
        end
    end

    def new
        check_user
        if params[:main_spirit_id]
            @recipe = Recipe.new(main_spirit_id: params[:main_spirit_id])
        else
            @recipe = Recipe.new
        end
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
        if !set_recipe
            redirect_to root_path, alert: "That page was not found."
        else
        @review = Review.new(recipe_id: @recipe.id)
        end
    end
    
    def edit
        if !set_recipe
            redirect_to root_path, alert: "That page was not found."
        else
        verify
        end
        # @recipe.main_spirit_id = nil
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

    def top_rated
        @recipes = Recipe.top_rated
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
