class StaticPagesController < ApplicationController

  include ApplicationHelper

  before_action :check_kiosk_signed_in, only: :index

  def index
  end

  def kiosk
  end

  def kiosk_user_profile
    @user = User.find(params[:id])
    @items = Item.all
  end

  def test_gcm
    PushNotificationsWorker.perform_async(["APA91bHhRal_G6RNAQ1VJqHVK19UCfq6OoITcTzR6xQC92557Bqpqq1HyoN2KGfgT77qWOH0v7pSAj-2qw_MuUbhKu6OgiLpkbGJwg0pqvbGRYIoRxYjbaMyZZD0s-Q81oJA5ZT3hes6U_rv7NI8G2BqFGn6C6lIYHXCu2_4Z4dAdOdv3iyLAP4"], "Hello World")
    render text: ""
  end

  private
  def check_kiosk_signed_in
    redirect_to kiosk_landing_path if kiosk_signed_in?
  end
end
