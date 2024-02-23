class GroceriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_grocery, except: %i[ index new create ]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /groceries or /groceries.json
  def index
    @groceries = current_user.groceries if current_user.present?
  end

  # GET /groceries/1 or /groceries/1.json
  def show
    @fridge_items = @grocery.fridge_items
  end

  # GET /groceries/new
  def new
    @grocery = current_user.groceries.build
  end

  # GET /groceries/1/edit
  def edit
  end

  # POST /groceries or /groceries.json
  def create
    @grocery = current_user.groceries.build(grocery_params)

    respond_to do |format|
      if @grocery.save
        format.html { redirect_to grocery_url(@grocery), notice: "Grocery was successfully created." }
        format.json { render :show, status: :created, location: @grocery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groceries/1 or /groceries/1.json
  def update
    respond_to do |format|
      if @grocery.update(grocery_params)
        format.html { redirect_to grocery_url(@grocery), notice: "Grocery was successfully updated." }
        format.json { render :show, status: :ok, location: @grocery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groceries/1 or /groceries/1.json
  def destroy
    @grocery.destroy!

    respond_to do |format|
      format.html { redirect_to groceries_url, notice: "Grocery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    get_grocery
    redirect_to groceries_path, notice: "Please sign in to view your groceries." if @grocery.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_grocery
      @grocery = current_user.groceries.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grocery_params
      params.require(:grocery).permit(:name, :user_id)
    end
end
