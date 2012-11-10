class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for
  	session[:ep_sessions] = {}

  def notice
  	@overlay = params[:overlay]
  	@message = params[:message]
  	respond_to do |format|
      format.js {render 'layouts/notice'}
    end
  end
end
