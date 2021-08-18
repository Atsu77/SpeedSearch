class Api::V1::UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    if user
      render json: {
        status: :ok,
        user: user
      }
    else
      render json: {
        status: 500
      }
    end
  end
end