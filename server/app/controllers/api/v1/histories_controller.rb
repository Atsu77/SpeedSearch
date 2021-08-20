class Api::V1::HistoriesController < ApplicationController
  include Scrape

  def index
    histories = current_api_v1_user.histories
    render json: {
      status: :ok,
      history: histories
    }
  end

  def show
    history = current_api_v1_user.histories.find_by(id: params[:id])
    if history
      render json: {
        status: :ok,
        history: history
      }
    else
      render json: {
        status: :no_content
      }
    end
  end

  def create
    url = history_params[:url]
    title = Scrape.page_title_scrape(url)
    history = current_api_v1_user.histories.build(url: url, title: title)
    tag_list = history_params[:tag_name].split(',')
    if history.save
      history.save_tag(tag_list)
      render json: { status: :create, history: history, tag_list: tag_list}
    else
      render json: { status: 500 }
    end
  end

  def destroy
    history = current_api_v1_user.histories.find_by(id: params[:id])
    if history.destroy
      render json: {
        status: :ok, message: "#{history.title}を削除しました"
      }
    else
      render json: {
        status: 404, message: '履歴が存在しません'
      }
    end
  end

  private

  def history_params
    params.require(:history).permit(:url, :tag_name)
  end
end
