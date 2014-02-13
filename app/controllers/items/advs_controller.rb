class Items::AdvsController < ApplicationController
  before_action :set_adv, only: [:show, :edit, :update, :destroy]

  # GET /advs
  # GET /advs.json
  def index
    @advs = Event.advs.all
  end

  # GET /advs/1
  # GET /advs/1.json
  def show
  end

  # GET /advs/new
  def new
    @adv = Adv.new
  end

  # GET /advs/1/edit
  def edit
  end

  # POST /advs
  # POST /advs.json
  def create
    @adv = Adv.new(adv_params)

    respond_to do |format|
      if @adv.save && Item.create(item_type: @adv.class, item_id: @adv.id)
        format.html { redirect_to @adv, notice: 'Adv was successfully created.' }
        format.json { render action: 'show', status: :created, location: @adv }
      else
        format.html { render action: 'new' }
        format.json { render json: @adv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advs/1
  # PATCH/PUT /advs/1.json
  def update
    respond_to do |format|
      if @adv.update(adv_params)
        format.html { redirect_to @adv, notice: 'Adv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advs/1
  # DELETE /advs/1.json
  def destroy
    @adv.destroy
    respond_to do |format|
      format.html { redirect_to advs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adv
      @adv = Adv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adv_params
      params.require(:adv).permit(:discription)
    end
end
