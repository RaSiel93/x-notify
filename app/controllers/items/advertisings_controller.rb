class Items::AdvertisingsController < ApplicationController
  before_action :set_advertising, only: [:show, :edit, :update, :destroy]

  def index
    @advertisings = Item.advertisings.all
  end

  def show
  end

  def new
    @advertising = Advertising.new
    @advertising.build_item
  end

  def edit
  end

  def create
    @advertising = Advertising.new(advertising_params)
    respond_to do |format|
      if @advertising.save
        format.html { redirect_to polymorphic_path([:items, @advertising]), notice: 'advertising was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advertising }
      else
        format.html { render action: 'new' }
        format.json { render json: @advertising.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @advertising.update(advertising_params)
        format.html { redirect_to polymorphic_path([:items, @advertising]), notice: 'advertising was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advertising.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @advertising.destroy
    respond_to do |format|
      format.html { redirect_to advertisings_url }
      format.json { head :no_content }
    end
  end

  private

  def set_advertising
    @advertising = Advertising.find(params[:id])
  end

  def advertising_params
    params.require(:advertising).permit(:description, item_attributes: [:title, :published])
  end
end
