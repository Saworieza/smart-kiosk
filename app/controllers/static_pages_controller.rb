class StaticPagesController < ApplicationController
  def index
  end

  def test_gcm
    PushNotificationsWorker.perform_async(["APA91bHhRal_G6RNAQ1VJqHVK19UCfq6OoITcTzR6xQC92557Bqpqq1HyoN2KGfgT77qWOH0v7pSAj-2qw_MuUbhKu6OgiLpkbGJwg0pqvbGRYIoRxYjbaMyZZD0s-Q81oJA5ZT3hes6U_rv7NI8G2BqFGn6C6lIYHXCu2_4Z4dAdOdv3iyLAP4"], "Hello World")
    render text: ""
  end
end
