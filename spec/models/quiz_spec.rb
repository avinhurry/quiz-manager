# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quiz, type: :model do
  quiz = Quiz.create(
    name: 'Proco Quiz'
  )

  it 'is database authenticable' do
    expect(quiz.name).to match('Proco Quiz')
  end
end
