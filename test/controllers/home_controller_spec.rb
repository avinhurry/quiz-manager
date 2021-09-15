# frozen_string_literal: true

require 'rails_helper'

describe HomeController, type: :controller do
  describe 'GET #root_path' do
    it 'returns a 200 status code' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
