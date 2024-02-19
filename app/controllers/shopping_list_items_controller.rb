class ShoppingListItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_shopping_list_item, except: %i[ index new create ]

  # GET /shopping_list_items or /shopping_list_items.json
  def index
    @shopping_list_items = ShoppingListItem.all
  end

  # GET /shopping_list_items/1 or /shopping_list_items/1.json
  def show
  end

  # GET /shopping_list_items/new
  def new
    @shopping_list_item = ShoppingListItem.new
  end

  # GET /shopping_list_items/1/edit
  def edit
  end

  # POST /shopping_list_items or /shopping_list_items.json
  def create
    @shopping_list_item = ShoppingListItem.new(shopping_list_item_params)

    respond_to do |format|
      if @shopping_list_item.save
        format.html { redirect_to shopping_list_item_url(@shopping_list_item), notice: "Shopping list item was successfully created." }
        format.json { render :show, status: :created, location: @shopping_list_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_list_items/1 or /shopping_list_items/1.json
  def update
    respond_to do |format|
      if @shopping_list_item.update(shopping_list_item_params)
        @shopping_list_item.update!(creator: "user")
        format.html { redirect_to shopping_list_item_url(@shopping_list_item), notice: "Shopping list item was successfully updated." }
        format.json { render :show, status: :ok, location: @shopping_list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_list_items/1 or /shopping_list_items/1.json
  def destroy
    @shopping_list_item.destroy!

    respond_to do |format|
      format.html { redirect_to shopping_list_items_url, notice: "Shopping list item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def check_off_shopping_list_item
    @shopping_list_item.update!(checked: !@shopping_list_item.checked)
    redirect_to shopping_list_items_path
  end

  def add_to_fridge
    set_fridge_item
    redirect_to action: :index
  end

  def edited_add_to_fridge
    fridge_item = set_fridge_item
    redirect_to edit_fridge_item_path(fridge_item)
  end

  def decline_add_to_fridge
    @shopping_list_item.destroy!
    redirect_to shopping_list_items_path
  end

  def undo_add_to_fridge
    #find and destroy fridge item
    #clears fridge_item_id column
    #dismissed = false
    #redirect back to index
    fridge_item = FridgeItem.find(@shopping_list_item.fridge_item_id)
    puts "fridge item: " + fridge_item.inspect
    fridge_item.destroy!
    @shopping_list_item.update!(dismissed: false, fridge_item_id:nil)
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_shopping_list_item
      @shopping_list_item = ShoppingListItem.find(params[:id])
    end

    def set_fridge_item
      fridge_item_params = {
        item_name: @shopping_list_item.name,
        item_quantity: @shopping_list_item.quantity
      }
      fridge_item = ::FridgeItemBuilder.new.build(fridge_item_params, current_user)
      fridge_item.save!
      @shopping_list_item.update!(dismissed: true, fridge_item_id: fridge_item.id)
      fridge_item
    end

    # Only allow a list of trusted parameters through.
    def shopping_list_item_params
      params.require(:shopping_list_item).permit(:name, :quantity, :creator)
    end
end
