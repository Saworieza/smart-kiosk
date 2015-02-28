class Api::V1::DevicesController < ApplicationController
  def create
    device = Device.new(device_params)
    if device.save
      render json: device, status: 201
    else
      render json: { errors: device.errors.as_json }, status: 420
    end
  end

  def show
    render json: Device.find_by(id: params[:id])
  end

  private
  def device_params
    params.permit(:id, :user_id, :token, :enabled, :platform)
  end
end
