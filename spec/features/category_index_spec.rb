require 'rails_helper'

RSpec.feature 'Category index pages', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'andry', email: 'andry@example.com', password: 'password123', confirmed_at: Time.now) }
  let!(:group1) { Group.create(user_id: user.id, name: 'food', icon: 'icon1') }
  let!(:group2) { Group.create(user_id: user.id, name: 'Bla', icon: 'icon2') }

  before do
    sign_in user
    visit groups_path
  end

  scenario 'User sees categories on the page' do
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content(group1.name)
    expect(page).to have_content(group2.name)
  end

  scenario 'User sees category icon' do
    within('.group-item', text: group1.name) do
      expect(page).to have_content('icon1')
      expect(page).to have_content(group1.total_amount)
    end

    within('.group-item', text: group2.name) do
      expect(page).to have_content('icon2')
      expect(page).to have_content(group2.total_amount)
    end
  end

  scenario 'User can navigate to add a new category' do
    click_link 'ADD NEW CATEGORY'
    expect(current_path).to eq(new_group_path)
  end
end
