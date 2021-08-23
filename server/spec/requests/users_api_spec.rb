require 'rails_helper'

RSpec.describe 'UsersApis', type: :request do
  describe 'ユーザー登録について' do
    it 'ユーザー登録できること' do
      user = FactoryBot.build(:user)
      post api_v1_user_registration_path, params: {
        name: user.name,
        email: user.email,
        password: user.password,
        password_confirmation: user.password_confirmation
      }

      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      puts json
      expect(json.length).to eq 2
    end

    it 'サインインして1件のurlを検索する' do
      user = FactoryBot.create(:user)
      response = sign_in(user)
      expect(response).to have_http_status(200)

      history_params = FactoryBot.attributes_for(:history)
      post api_v1_user_histories_path(user.id), 
      headers: {
        "access-token" => response.headers["access-token"],
        "client" => response.headers["client"],
        "uid" => response.headers["uid"]
      },
      params: {
        history: history_params
      }
    end
  end
end
