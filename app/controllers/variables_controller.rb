class VariablesController < ApplicationController
  before_action :set_variable, only: [:show,update]
  respond_to :json

  # GET /variables/1
  # GET /variables/1.json
  def show
  end

  def findByName
    @variable = Variable.find_by_name params[:name]
    respond_with @variable
  end


  # PATCH/PUT /variables/1
  # PATCH/PUT /variables/1.json
  def update
    respond_to do |format|
      if @variable.update(variable_params)
        format.html { redirect_to @variable, notice: 'Variable was successfully updated.' }
        format.json { render :show, status: :ok, location: @variable }
      else
        format.html { render :edit }
        format.json { render json: @variable.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variable
      @variable = Variable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variable_params
      params.require(:variable).permit(:name, :value)
    end
end
