require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'andry', email: 'andry@example.com', password: 'password123', confirmed_at: Time.now) }

  it 'should have an integer user_id' do
    group = Group.new(user_id: user.id, name: 'food', icon: 'icon')
    group.user_id = nil
    expect(group).to_not be_valid
  end

  it 'name should be presence ' do
    group = Group.new(user_id: user.id, name: 'food', icon: 'icon')
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'icon should be presence ' do
    group = Group.new(user_id: user.id, name: 'food', icon: 'icon')
    group.icon = nil
    expect(group).to_not be_valid
  end
end
