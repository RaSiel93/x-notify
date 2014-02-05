class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :send_item_id]

  @@gcm = GCM.new('AIzaSyDnEEoFJG1-K-QmV7qdkYyLHWIIqvJ5Of4')

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
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
    # Use callbacks to share common setup or constraints between actions.
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_type, :item_id)
    end
end
