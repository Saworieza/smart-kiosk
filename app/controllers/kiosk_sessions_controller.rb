class KioskSessionsController < ApplicationController

  def new
  end

  def create
    kiosk = Kiosk.authenticate_kiosk(params[:unique_id], params[:password])
    if kiosk
      session[:kiosk_id] = kiosk.id
      redirect_to kiosk_landing_path
    else
      flash.now.alert = "Invalid Unique Id or Password"
      render 'new'
    end
  end

  def sign_out
    session[:kiosk_id] = nil
    redirect_to root_path
  end
end
