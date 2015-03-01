class VendorsController < ApplicationController
  def index
    @users = User.all
    @top_users = User.order("points DESC").all.limit(20)
  end
end
