class FridgeItemTaggingsController < ApplicationController
  before_action :set_fridge_item_tagging, only: %i[ show edit update destroy ]

  # GET /fridge_item_taggings or /fridge_item_taggings.json
  def index
    @fridge_item_taggings = FridgeItemTagging.all
  end

  # GET /fridge_item_taggings/1 or /fridge_item_taggings/1.json
  def show
  end

  # GET /fridge_item_taggings/new
  def new
    @fridge_item_tagging = FridgeItemTagging.new
  end

  # GET /fridge_item_taggings/1/edit
  def edit
  end

  # POST /fridge_item_taggings or /fridge_item_taggings.json
  def create
    @fridge_item_tagging = FridgeItemTagging.new(fridge_item_tagging_params)

    respond_to do |format|
      if @fridge_item_tagging.save
        format.html { redirect_to fridge_item_tagging_url(@fridge_item_tagging), notice: "Fridge item tagging was successfully created." }
        format.json { render :show, status: :created, location: @fridge_item_tagging }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fridge_item_tagging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fridge_item_taggings/1 or /fridge_item_taggings/1.json
  def update
    respond_to do |format|
      if @fridge_item_tagging.update(fridge_item_tagging_params)
        format.html { redirect_to fridge_item_tagging_url(@fridge_item_tagging), notice: "Fridge item tagging was successfully updated." }
        format.json { render :show, status: :ok, location: @fridge_item_tagging }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fridge_item_tagging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fridge_item_taggings/1 or /fridge_item_taggings/1.json
  def destroy
    @fridge_item_tagging.destroy!

    respond_to do |format|
      format.html { redirect_to fridge_item_taggings_url, notice: "Fridge item tagging was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fridge_item_tagging
      @fridge_item_tagging = FridgeItemTagging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fridge_item_tagging_params
      params.require(:fridge_item_tagging).permit(:fridge_item_id, :tag_id)
    end
end
