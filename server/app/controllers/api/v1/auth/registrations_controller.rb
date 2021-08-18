class Api::V1::Auth::RegistrationsController < Devise::RegistrationsController

  def create
    user = User.create!(sign_up_params)

    if user
      render json: { status: :create, user: user}
    else
      render json: { status: 500}
    end
    
  end

  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:email, :password)
  end
end
