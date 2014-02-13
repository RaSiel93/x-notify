class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :send_item_id]

  @@gcm = GCM.new('AIzaSyDnEEoFJG1-K-QmV7qdkYyLHWIIqvJ5Of4')

  def index
    @items = Item.all
  end

  def send_item_id
    registration_ids = User.all.map{|i| i.registration_id}
    options = {data: {score: "#{@item.id}"}, collapse_key: "updated_score"}
    response = @@gcm.send_notification(registration_ids, options)

    respond_to do |format|
      if response[:status_code] == 200
        format.html { redirect_to @item, notice: 'Message passed success' }
      else
        format.html { redirect_to @item, notice: 'Message passed failed' }
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])

    case @item.item_type
    when 'Adv' 
      @adv = Adv.find(@item.item_id)
    when 'Event'
      @event = Event.find(@item.item_id)
    when 'Discount'
      @discount = Discount.find(@item.item_id)
    end
  end

  def item_params
    params.require(:item).permit(:item_type, :item_id)
  end
end
