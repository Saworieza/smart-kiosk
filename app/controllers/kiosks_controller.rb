class KiosksController < ApplicationController

  before_action :authenticate_vendor!
  before_action :set_kiosk, only: [:show, :edit, :update, :destroy]

  def index
    @kiosks = current_vendor.kiosks.all
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @kiosk = Kiosk.new
  end

  def edit
  end

  def create
    @kiosk = Kiosk.new(kiosk_params) do |kiosk|
      kiosk.vendor = current_vendor
    end

    respond_to do |format|
      if @kiosk.save
        format.html { redirect_to @kiosk, notice: 'kiosk was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @kiosk.update(kiosk_params)
        format.html { redirect_to kiosks_path, notice: 'kiosk was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @kiosk.destroy
    respond_to do |format|
      format.html { redirect_to kiosks_url }
    end
  end

  private
  def set_kiosk
    @kiosk = Kiosk.find(params[:id])
  end

  def kiosk_params
    params.require(:kiosk).permit(:unique_id, :password, :beacon_uuid, :store_id)
  end
end
