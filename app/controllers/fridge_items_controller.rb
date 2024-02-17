class FridgeItemsController < ApplicationController
  before_action :get_fridge_item, except: %i[ index new create ]
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /fridge_items or /fridge_items.json

  def index
    sort_map =  {
      exp: "expiration_date",
      name: "item_name"
    }
    @sort_param = params[:sort]

    sort_key = sort_map[@sort_param&.to_sym]
    puts sort_key

    if current_user.present?
      #@fridge_items = current_user.fridge_items.where("item_quantity > 0")
      @fridge_items = current_user.fridge_items.where(dismissed: false)
      @fridge_items = @fridge_items.order(sort_key) if sort_key
      #@fridge_items = current_user.fridge_items.filter{|item| item.item_quantity > 0} if current_user.present?
    end
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
    # @fridge_item = current_user.fridge_items.build(fridge_item_params)
    # item_name = @fridge_item.item_name
    # @fridge_item.grocery_name = item_name
    # @fridge_item.initial_quantity = @fridge_item.item_quantity

    # #create new grocery if not already in database
    # Grocery.create!(name: item_name) if !Grocery.find_by(name:item_name)

    @fridge_item = FridgeItemBuilder.new.build(fridge_item_params, current_user)

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
        @fridge_item.update!(item_quantity: 0) if @fridge_item.item_quantity < 0
        if @fridge_item.item_quantity <= 0
          ShoppingListItem.create!(name: @fridge_item.item_name, quantity: @fridge_item.initial_quantity, creator: "auto")
        end
        format.html { redirect_to fridge_items_path }
        format.json { render :show, status: :ok, location: @fridge_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fridge_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fridge_items/1 or /fridge_items/1.json
  def destroy
    #set disposed_quantity to be the last known quantity
    @fridge_item.disposed_quantity = @fridge_item.item_quantity
    #set item_quantity to 0 so that it is now visible in groceries tab
    @fridge_item.item_quantity = 0
    #add ex fridge item to shopping list? (create new shopping_list_item)
    #ShoppingListItem.create!(name: @fridge_item.item_name, quantity: @fridge_item.initial_quantity, creator: "auto")
    @fridge_item.save

    respond_to do |format|
      format.html { redirect_to fridge_items_url, notice: "Fridge item was successfully destroyed. Added to Shopping List!" }
      format.json { head :no_content }
    end
  end

  def correct_user
    #@fridge_item = current_user.fridge_items.find_by(id: params[:id])
    get_fridge_item
    redirect_to fridge_items_path, notice: "Please sign in to view and edit your fridge items." if @fridge_item.nil?
  end

  def increment_quantity
    #@fridge_item = current_user.fridge_items.find_by(id: params[:id])
    get_fridge_item
    @fridge_item.update!(item_quantity: @fridge_item.item_quantity + 1)
    redirect_to fridge_items_path
    #increment_counter(:item_quantity, @fridge_item)
  end

  def decrement_quantity
    #@fridge_item = current_user.fridge_items.find_by(id: params[:id])
    get_fridge_item
    @fridge_item.item_quantity >= 1 ? @fridge_item.update!(item_quantity: @fridge_item.item_quantity - 1) : @fridge_item.update!(item_quantity: 0)
    # @fridge_item.update!(item_quantity: @fridge_item.item_quantity - 1)
    # if @fridge_item.item_quantity <= 0
    #   ShoppingListItem.create!(name: @fridge_item.item_name, quantity: @fridge_item.initial_quantity, creator: "auto")
    #   redirect_to fridge_items_path, notice: "Fridge item deleted and added to Shopping List!"
    # else
      redirect_to fridge_items_path
    # end
  end

  def inline_edit
    get_fridge_item
  end

  def add_to_shopping_list
    set_shopping_list_item
  end

  def edited_add_to_shopping_list
    shopping_list_item = set_shopping_list_item
    redirect_to edit_shopping_list_item_path(shopping_list_item)
  end

  def decline_add_to_shopping_list
    @fridge_item.update!(dismissed: true)
    redirect_to fridge_items_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_fridge_item
      #@fridge_item = FridgeItem.find(params[:id])
      @fridge_item = current_user.fridge_items.find_by(id: params[:id])
    end

    def set_shopping_list_item
      shopping_list_item = ShoppingListItem.create!(name: @fridge_item.item_name, quantity: @fridge_item.initial_quantity, creator: "auto")
      @fridge_item.update!(dismissed: true)
      shopping_list_item
    end

    # Only allow a list of trusted parameters through.
    def fridge_item_params
      params.require(:fridge_item).permit(:item_name, :item_quantity, :expiration_date, :notes, :user_id)
    end
end
