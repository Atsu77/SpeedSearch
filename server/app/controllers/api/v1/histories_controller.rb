class Api::V1::HistoriesController < ApplicationController

  def create
    url = history_params[:url]
    binding.pry
    history = current_api_v1_user.histories.create!(url: url)
    render json: { status: :create, history: history } if history
  end

  private

  def history_params
    params.require(:histories).permit(:url)
  end
end
