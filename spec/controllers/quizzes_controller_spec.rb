# frozen_string_literal: true

require 'rails_helper'

describe QuizzesController, type: :controller do
  describe 'GET /index' do
    it 'returns a 302 status code' do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      Quiz.create(name: 'My Amazing Quiz')
      expect(response).to be_successful
    end
  end
end
