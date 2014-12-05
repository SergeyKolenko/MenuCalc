class FoodDishesController < ApplicationController
  before_action :set_food_dish, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /dish_groups
  # GET /dish_groups.json
  def index
    @food_dish = FoodDish.all
  end

  # GET /dish_groups/1
  # GET /dish_groups/1.json
  def show
  end

  # GET /dish_groups/new
  def new
    @food_dish = FoodDish.new
  end

  # GET /dish_groups/1/edit
  def edit
  end

  # POST /dish_groups
  # POST /dish_groups.json
  def create
    @food_dish = FoodDish.new(food_dish_params)

    respond_to do |format|
      if @food_dish.save
        format.html { redirect_to @food_dish, notice: ' was successfully created.' }
        format.json { render :show, status: :created, location: @food_dish }
      else
        format.html { render :new }
        format.json { render json: @food_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dish_groups/1
  # PATCH/PUT /dish_groups/1.json
  def update
    respond_to do |format|
      if @food_dish.update_attributes(food_dish_params)
        format.html { redirect_to @food_dish, notice: ' was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_dish }
      else
        format.html { render :edit }
        format.json { render json: @food_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_groups/1
  # DELETE /dish_groups/1.json
  def destroy
    @food_dish.destroy params[:id]
    respond_to do |format|
      format.html { redirect_to @food_dish_url, notice: ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_food_dish
    @food_dish = FoodDish.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def food_dish_params
    params.require(:food_dish).permit(:dish_id,:food_id,:quantity)
  end
end
