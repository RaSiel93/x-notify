class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from(Exception) {
    render :json => {error: {status: 404, message: 'not found'}}
  }
end
