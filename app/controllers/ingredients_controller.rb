class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  before_action :set_meal

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = @meal.ingredients || Ingredient.all
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = @meal.ingredients.new
    if params[:name].present?
      @ingredient.name = params[:name]
    end
    if params[:notes].present?
      @ingredient.notes = params[:notes]
    end
    if params[:source_fridge_item_id].present?
      @fridge_item = FridgeItem.find(params[:source_fridge_item_id])
    end
    @from_fridge = params[:from_fridge]
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients or /ingredients.json
  def create
    @from_fridge = params[:ingredient][:from_fridge]
    @ingredient = @meal.ingredients.new(ingredient_params)
    respond_to do |format|
      if @ingredient.save
        if @from_fridge == "true"
          format.html { redirect_to fridge_items_path(meal: @meal.id), notice: "Ingredient was successfully created." }
        else
          format.html { redirect_to edit_meal_path(@meal.id)}
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to meal_ingredient_url(@meal, @ingredient), notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to meal_ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
    def set_meal
      @meal = Meal.find(params[:meal_id])
    end
    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :notes, :meal_id, :source_fridge_item_id)
    end
end
