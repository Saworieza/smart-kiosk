class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.remote_avatar_url = "https://graph.facebook.com/" + params[:name] + "/picture?width=800"
    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors.as_json }, status: 420
    end
  end

  def show
    render json: User.find_by(id: params[:id])
  end

  private
  def user_params
    params.permit(:id, :name, :email, :password, :avatar)
  end
end
