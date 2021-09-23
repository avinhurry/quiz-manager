# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuizzesController, type: :routing do
  describe 'routing' do
    it 'routes_to #index' do
      expect(get: '/quizzes').to route_to('quizzes#index')
    end

    it 'routes_to #create' do
      expect(post: '/quizzes').to route_to('quizzes#create')
    end

    it 'routes_to #new' do
      expect(GET: '/quizzes/new').to route_to('quizzes#new')
    end

    it 'routes_to #edit' do
      expect(GET: '/quizzes/1/edit').to route_to('quizzes#edit', id: '1')
    end

    it 'routes_to #show' do
      expect(GET: '/quizzes/1').to route_to('quizzes#show', id: '1')
    end

    it 'routes_to #update' do
      expect(PATCH: '/quizzes/1').to route_to('quizzes#update', id: '1')
    end

    it 'routes_to #update' do
      expect(PUT: '/quizzes/1').to route_to('quizzes#update', id: '1')
    end

    it 'routes_to #destroy' do
      expect(DELETE: '/quizzes/1').to route_to('quizzes#destroy', id: '1')
    end
  end
end
