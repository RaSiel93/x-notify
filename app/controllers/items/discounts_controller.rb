class Items::DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy]

  def index
    @discounts = Item.discounts.all
  end

  def show
  end

  def new
    @discount = Discount.new
    @discount.build_item
  end

  def edit
  end

  def create  
    @discount = Discount.new(discount_params)
    respond_to do |format|
      if @discount.save
        format.html { redirect_to polymorphic_path([:items, @discount]), notice: 'discount was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discount }
      else
        format.html { render action: 'new' }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discount.update(discount_params)
        format.html { redirect_to polymorphic_path([:items, @discount]), notice: 'discount was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discount.destroy
    respond_to do |format|
      format.html { redirect_to discounts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_discount
    @discount = Discount.find(params[:id])
  end

  def discount_params
    params.require(:discount).permit(:description, :amount, item_attributes: [:title, :published])
  end
end
