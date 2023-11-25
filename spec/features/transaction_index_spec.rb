require 'rails_helper'

RSpec.feature 'Transaction index page', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'andry', email: 'andry@example.com', password: 'password123', confirmed_at: Time.now) }
  let!(:group1) { Group.create(user_id: user.id, name: 'food', icon: 'icon1') }
  let!(:group2) { Group.create(user_id: user.id, name: 'Bla', icon: 'icon2') }
  let!(:transaction1) { Operation.create(name: 'Groceries', amount: 50, user:, groups: [group1]) }
  let!(:transaction2) { Operation.create(name: 'Clothes', amount: 30, user:, groups: [group2]) }

  before do
    sign_in user
    visit group_operations_path(group1)
  end

  scenario 'User sees transactions on the page' do
    expect(page).to have_content('TRANSACTIONS')
    expect(page).to have_content(transaction1.name)
    expect(page).to have_content(transaction1.amount)
    expect(page).to have_content(transaction2.name)
    expect(page).to have_content(transaction2.amount)
  end

  scenario 'User sees transaction details' do
    within('.transaction-item', text: transaction1.name) do
      expect(page).to have_content("$#{transaction1.amount}")
    end

    within('.transaction-item', text: transaction2.name) do
      expect(page).to have_content("$#{transaction2.amount}")
    end
  end

  scenario 'User can navigate to add a new transaction' do
    click_link 'ADD NEW TRANSACTION'
    expect(current_path).to eq(new_group_operation_path(group1))
  end
end
