class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy, :show_send, :send_message]

	skip_before_filter  :verify_authenticity_token

  @@gcm = GCM.new('AIzaSyDnEEoFJG1-K-QmV7qdkYyLHWIIqvJ5Of4')

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def show_send
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def send_message
    message_text = params[:message_text]

    registration_ids = [User.find(params[:id]).registration_id]
    options = {data: {score: "#{message_text}"}, collapse_key: "updated_score"}
    response = @@gcm.send_notification(registration_ids, options)


    respond_to do |format|
      if response[:status_code] == 200
        format.html { redirect_to @user, notice: 'Message passed success' }
      else
        format.html { redirect_to @user, notice: 'Message passed failed' }
      end
    end
  end

private

  def user_params
    if params[:user].nil?
      {:login => params[:login], :registration_id => params[:registration_id]}
    else
      params.require(:user).permit(:login, :registration_id)
    end
  end

  def find_user
    @user = User.find(params[:id])
  end
end
