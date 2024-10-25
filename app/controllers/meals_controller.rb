class MealsController < ApplicationController
  def index
    @meals = current_user.meals if current_user.present?
  end

  def show

  end

  def new
    @meal = current_user.meal.build
  end

  def edit

  end

  def create

  end

  def update
    #add ingredient to meal from fridge or manually
  end

  def destroy

  end
end
