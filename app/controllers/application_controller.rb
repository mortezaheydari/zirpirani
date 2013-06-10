class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_to(options = {}, response_status_and_flash = {})
    if success = response_status_and_flash.delete(:success)
      flash[:success] = success
    end

    if secondary = response_status_and_flash.delete(:secondary)
      flash[:secondary] = secondary
    end

    super(options, response_status_and_flash)
  end    
  
end
