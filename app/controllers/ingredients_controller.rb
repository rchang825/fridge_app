class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredients.all #is there a point to showing all ingredients ever used?
    @meal = Meal.find_by(id: params[:meal_id])
  end

  def show

  end

  def new
    @ingredient = meal.ingredients.build
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end
end
