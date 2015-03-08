class StaticPagesController < ApplicationController

  include ApplicationHelper

  before_action :check_kiosk_signed_in, only: :index

  def index
  end

  def kiosk
  end

  def kiosk_user_profile
    @user = User.find(params[:id])
    @items = Item.all.order("created_at DESC")
  end

  def video_call
    @api_key = '45174522'
    @session_id = $session_id
    @token = $token
  end

  def test_gcm
    PushNotificationsWorker.perform_async(["APA91bEU1hWx9vRj4RJA_EiBo06Qiedkd3GGuwE-jD6NJ9DwaoK8KUIlnCUF-Fx47IDiUFrUEJI2MC8c8PILbBval7Z5XzllJ6wgZH1lXhrd_KoIFlARNeTeOao2p-r6Nq0nv76h96ElU5iyMEtOujiaVgjb6QcJbmLLmKYPzEIlWXwPMrjzI2k"], "Hello World")
    render text: ""
  end

  private
  def check_kiosk_signed_in
    redirect_to kiosk_landing_path if kiosk_signed_in?
  end
end
