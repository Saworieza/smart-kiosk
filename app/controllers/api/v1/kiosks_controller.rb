class Api::V1::KiosksController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    kiosk = Kiosk.find_by(beacon_uuid: params[:beacon_uuid])
    if user && kiosk
      user.notify_kiosk(kiosk)
      render json: { message: "success" }, status: 200
    else
      render json: { error: "Couldn't find your device or kiosk" }, status: 420
    end
  end

  def destroy
  end
end
