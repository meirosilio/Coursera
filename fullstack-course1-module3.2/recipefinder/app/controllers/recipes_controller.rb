class RecipesController < ApplicationController
  def index
    @search_term = params[:search]
    if @search_term.nil?
      @recipes = Recipe.for("chocolate")
      @search_term = 'chocolate'
    else
      @recipes = Recipe.for(@search_term)
    end
  end
end
