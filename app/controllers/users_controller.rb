class UsersController < ApplicationController

  before_action :authenticate_vendor!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def send_coupon
    device = User.find(params[:user_id]).device
    PushNotificationsWorker.perform_async([device.token], "Hello World")
    respond_to do |format|
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :points, :level, :avatar)
  end

end
