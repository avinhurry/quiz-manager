# frozen_string_literal: true

require 'rails_helper'

describe HomeController, type: :controller do
  describe 'homepage' do
    context 'when not signed in and navigate to root path' do
      it 'returns a 200 status code' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when signed in and navigate to root path' do
      let(:current_user) do
        User.create!(email: 'proc@proc.com',
                     password: 'verysecure',
                     password_confirmation: 'verysecure')
      end

      before do
        allow(controller).to receive(:current_user).and_return(current_user)
      end

      it 'returns a 200 status code' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
