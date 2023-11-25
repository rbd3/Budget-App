# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password123', confirmed_at: Time.now) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a role' do
    user.role = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with an invalid role' do
    user.role = 'invalid_role'
    expect(user).to_not be_valid
  end

  it 'is valid with a valid role' do
    user.role = 'user'
    expect(user).to be_valid
  end

  it 'has many groups' do
    expect(user.groups).to be_empty
  end

  it 'has many operations' do
    expect(user.operations).to be_empty
  end
end
