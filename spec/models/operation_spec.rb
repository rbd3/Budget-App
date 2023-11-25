# spec/models/operation_spec.rb

require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password123', confirmed_at: Time.now) }
  let(:group) { Group.create(name: 'Food', user:, icon: 'food_icon.png') }

  it 'is valid with valid attributes' do
    operation = Operation.new(name: 'Transaction', amount: 50.0, user:)
    operation.groups << group
    expect(operation).to be_valid
  end

  it 'is not valid without a name' do
    operation = Operation.new(amount: 50.0, user:)
    operation.groups << group
    operation.name = nil
    expect(operation).to_not be_valid
  end

  it 'is not valid without an amount' do
    operation = Operation.new(name: 'Transaction', user:)
    operation.groups << group
    operation.amount = nil
    expect(operation).to_not be_valid
  end

  it 'is not valid with a non-positive amount' do
    operation = Operation.new(name: 'Transaction', amount: -10.0, user:)
    operation.groups << group
    expect(operation).to_not be_valid
  end

  it 'belongs to a user' do
    operation = Operation.new(name: 'Transaction', amount: 50.0, user:)
    operation.groups << group
    expect(operation.user).to eq(user)
  end

  it 'has and belongs to many groups' do
    operation = Operation.new(name: 'Transaction', amount: 50.0, user:)
    operation.groups << group
    expect(operation.groups).to include(group)
  end
end
