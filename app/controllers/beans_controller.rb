class BeansController < ApplicationController
  before_action :set_bean, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:rate, :create, :update]

  # GET /beans
  # GET /beans.json
  def index
    @beans = Bean.all
  end

  def current
    @beans = Bean.all.where(in_stock: true)
  end

  # GET /beans/1
  # GET /beans/1.json
  def show
  end

  # GET /beans/new
  def new
    @bean = Bean.new
  end

  # GET /beans/1/edit
  def edit
  end

  # POST /beans
  # POST /beans.json
  def create
    @bean = Bean.new(bean_params)

    respond_to do |format|
      if @bean.save
        format.html { redirect_to @bean, notice: 'Bean was successfully created.' }
        format.json { render :show, status: :created, location: @bean }
      else
        format.html { render :new }
        format.json { render json: @bean.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beans/1
  # PATCH/PUT /beans/1.json
  def update
    respond_to do |format|
      if @bean.update(bean_params)
        format.html { redirect_to @bean, notice: 'Bean was successfully updated.' }
        format.json { render :show, status: :ok, location: @bean }
      else
        format.html { render :edit }
        format.json { render json: @bean.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beans/1
  # DELETE /beans/1.json
  def destroy
    @bean.destroy
    respond_to do |format|
      format.html { redirect_to beans_url, notice: 'Bean was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rate
    bean_rating = BeanRating.all.where(bean_id: params[:bean_id], user_id: current_user.id)[0]
    unless params[:rating].blank?
      if bean_rating
        bean_rating.update(rating: params[:rating])
      else
        bean_rating = BeanRating.new(bean_id: params[:bean_id], user_id: current_user.id, rating: params[:rating])
        bean_rating.save
      end
    end
    redirect_to current_beans_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bean
      @bean = Bean.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bean_params
      params.require(:bean).permit(:roaster_id, :name, :roast_level_id, :origin_id, :notes, :in_stock)
    end
end
