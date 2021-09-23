require 'rails_helper'

RSpec.describe User, type: :model do

  user = User.create(
    email: 'test@example.com',
    password: 'password123',
    password_confirmation: 'password123'
  )

  it 'is database authenticable' do
    expect(user.valid_password?('password123')).to be_truthy
  end
end