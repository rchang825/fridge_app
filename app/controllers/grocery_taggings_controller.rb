class GroceryTaggingsController < ApplicationController
  before_action :set_grocery_tagging, only: %i[ show edit update destroy ]

  # GET /grocery_taggings or /grocery_taggings.json
  def index
    @grocery_taggings = GroceryTagging.all
  end

  # GET /grocery_taggings/1 or /grocery_taggings/1.json
  def show
  end

  # GET /grocery_taggings/new
  def new
    @grocery_tagging = GroceryTagging.new
  end

  # GET /grocery_taggings/1/edit
  def edit
  end

  # POST /grocery_taggings or /grocery_taggings.json
  def create
    @grocery_tagging = GroceryTagging.new(grocery_tagging_params)

    respond_to do |format|
      if @grocery_tagging.save
        format.html { redirect_to grocery_tagging_url(@grocery_tagging), notice: "Grocery tagging was successfully created." }
        format.json { render :show, status: :created, location: @grocery_tagging }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grocery_tagging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grocery_taggings/1 or /grocery_taggings/1.json
  def update
    respond_to do |format|
      if @grocery_tagging.update(grocery_tagging_params)
        format.html { redirect_to grocery_tagging_url(@grocery_tagging), notice: "Grocery tagging was successfully updated." }
        format.json { render :show, status: :ok, location: @grocery_tagging }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grocery_tagging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grocery_taggings/1 or /grocery_taggings/1.json
  def destroy
    @grocery_tagging.destroy!

    respond_to do |format|
      format.html { redirect_to grocery_taggings_url, notice: "Grocery tagging was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery_tagging
      @grocery_tagging = GroceryTagging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grocery_tagging_params
      params.fetch(:grocery_tagging, {})
    end
end
