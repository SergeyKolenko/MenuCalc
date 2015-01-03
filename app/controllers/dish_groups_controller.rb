class DishGroupsController < ApplicationController
  before_action :set_dish_group, only: [:show, :update, :destroy]
  respond_to :json

  # GET /dish_groups
  # GET /dish_groups.json
  def index
    @dish_groups = DishGroup.all
  end

  # GET /dish_groups/1
  # GET /dish_groups/1.json
  def show
  end

  # POST /dish_groups
  # POST /dish_groups.json
  def create
    @dish_group = DishGroup.new(dish_group_params)

    respond_to do |format|
      if @dish_group.save
        format.html { redirect_to @dish_group, notice: 'Dish group was successfully created.' }
        format.json { render :show, status: :created, location: @dish_group }
      else
        format.html { render :new }
        format.json { render json: @dish_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dish_groups/1
  # PATCH/PUT /dish_groups/1.json
  def update
    respond_to do |format|
      if @dish_group.update_attributes(dish_group_params)
        format.html { redirect_to @dish_group, notice: 'Dish group was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish_group }
      else
        format.html { render :edit }
        format.json { render json: @dish_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_groups/1
  # DELETE /dish_groups/1.json
  def destroy
    @dish_group.destroy
    respond_to do |format|
      format.html { redirect_to dish_groups_url, notice: 'Dish group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_group
      @dish_group = DishGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_group_params
      params.require(:dish_group).permit(:name)
    end
end
