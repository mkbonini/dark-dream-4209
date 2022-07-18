class RecipesController < ApplicationController
    def index
        @recipes = Recipe.order_by_name
    end

    def show
        @recipe = Recipe.find(params[:id])
    end
end