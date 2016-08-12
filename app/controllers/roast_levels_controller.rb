class RoastLevelsController < ApplicationController
  before_action :set_roast_level, only: [:show, :edit, :update, :destroy]

  # GET /roast_levels
  # GET /roast_levels.json
  def index
    @roast_levels = RoastLevel.all
  end

  # GET /roast_levels/1
  # GET /roast_levels/1.json
  def show
  end

  # GET /roast_levels/new
  def new
    @roast_level = RoastLevel.new
  end

  # GET /roast_levels/1/edit
  def edit
  end

  # POST /roast_levels
  # POST /roast_levels.json
  def create
    @roast_level = RoastLevel.new(roast_level_params)

    respond_to do |format|
      if @roast_level.save
        format.html { redirect_to @roast_level, notice: 'Roast level was successfully created.' }
        format.json { render :show, status: :created, location: @roast_level }
      else
        format.html { render :new }
        format.json { render json: @roast_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roast_levels/1
  # PATCH/PUT /roast_levels/1.json
  def update
    respond_to do |format|
      if @roast_level.update(roast_level_params)
        format.html { redirect_to @roast_level, notice: 'Roast level was successfully updated.' }
        format.json { render :show, status: :ok, location: @roast_level }
      else
        format.html { render :edit }
        format.json { render json: @roast_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roast_levels/1
  # DELETE /roast_levels/1.json
  def destroy
    @roast_level.destroy
    respond_to do |format|
      format.html { redirect_to roast_levels_url, notice: 'Roast level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roast_level
      @roast_level = RoastLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roast_level_params
      params.require(:roast_level).permit(:name)
    end
end
