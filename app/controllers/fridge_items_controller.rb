class FridgeItemsController < ApplicationController
  before_action :set_fridge_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /fridge_items or /fridge_items.json
  def index
    @fridge_items = current_user.fridge_items.where("item_quantity > 0") if current_user.present?
    #@fridge_items = current_user.fridge_items.filter{|item| item.item_quantity > 0} if current_user.present?

  end

  # GET /fridge_items/1 or /fridge_items/1.json
  def show
  end

  # GET /fridge_items/new
  def new
    @fridge_item = current_user.fridge_items.build
  end

  # GET /fridge_items/1/edit
  def edit
  end

  # POST /fridge_items or /fridge_items.json
  def create

    #saves initial quantity to fridge item and grocery
    @fridge_item = current_user.fridge_items.build(fridge_item_params)
    item_name = @fridge_item.item_name
    @fridge_item.grocery_name = item_name
    @fridge_item.initial_quantity = @fridge_item.item_quantity

    #create new grocery if not already in database
    Grocery.create!(name: item_name) if !Grocery.find_by(name:item_name)
    #puts fridge_item_params.to_h.merge({grocery_name:item_name_param}).inspect

    #puts "FI:"
    #puts @fridge_item.inspect
    respond_to do |format|
      if @fridge_item.save
        format.html { redirect_to fridge_item_url(@fridge_item), notice: "Fridge item was successfully created." }
        format.json { render :show, status: :created, location: @fridge_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fridge_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fridge_items/1 or /fridge_items/1.json
  def update
    respond_to do |format|
      if @fridge_item.update(fridge_item_params)
        format.html { redirect_to fridge_item_url(@fridge_item), notice: "Fridge item was successfully updated." }
        format.json { render :show, status: :ok, location: @fridge_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fridge_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fridge_items/1 or /fridge_items/1.json
  def destroy
    @fridge_item.item_quantity = 0
    @fridge_item.save

    respond_to do |format|
      format.html { redirect_to fridge_items_url, notice: "Fridge item was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def correct_user
    @fridge_item = current_user.fridge_items.find_by(id: params[:id])
    redirect_to fridge_items_path, notice: "Please sign in to view and edit your fridge items." if @fridge_item.nil?
  end
  def increment_quantity
    @fridge_item = current_user.fridge_items.find_by(id: params[:id])
    @fridge_item.update!(item_quantity: @fridge_item.item_quantity + 1)
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
    #increment_counter(:item_quantity, @fridge_item)
  end
  def decrement_quantity
    @fridge_item = current_user.fridge_items.find_by(id: params[:id])
    @fridge_item.update!(item_quantity: @fridge_item.item_quantity - 1)
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fridge_item
      @fridge_item = FridgeItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fridge_item_params
      params.require(:fridge_item).permit(:item_name, :item_quantity, :expiration_date, :notes, :user_id)
    end
end
