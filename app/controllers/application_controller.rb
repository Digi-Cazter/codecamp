class ApplicationController < ActionController::Base
  protect_from_forgery

  def notice
  	@overlay = params[:overlay]
  	@message = params[:message]
  	respond_to do |format|
      format.js {render 'layouts/notice'}
    end
  end
end
