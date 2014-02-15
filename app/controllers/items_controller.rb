class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :send_item_id]

  @@gcm = GCM.new('AIzaSyDnEEoFJG1-K-QmV7qdkYyLHWIIqvJ5Of4')

  def index
    @items = Item.all
  end

  def send_item_id
    registration_ids = User.pluck(:registration_id)
    options = {data: {score: "#{@item.id}"}, collapse_key: "updated_score"}
    response = @@gcm.send_notification(registration_ids, options)
    
    binding.pry

    respond_to do |format|
      if response[:status_code] == 200
        format.html { redirect_to polymorphic_path([:items, @item.content]), notice: 'Message passed success' }
      else
        format.html { redirect_to polymorphic_path([:items, @item.content]), notice: 'Message passed failed' }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_type, :item_id)
  end
end
