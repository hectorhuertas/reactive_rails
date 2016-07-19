require 'rails_helper'

RSpec.describe 'user_CRUD', type: :feature do
  context 'New user' do
    context 'with correct data' do
      it "register successfully" do
        save_and_open_page
        user = FactoryGirl.build_stubbed(:user)
        visit new_user_path
        fill_in 'user[username]', with: user.username
        fill_in 'user[email]', with: user.email
        click_on 'Create User'

        expect(User.count).to eq(1)
        expect(current_path).to eq(user_path(User.last.id))
        expect(page).to have_text(user.username)
      end
    end
  end
end

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(email, password)
    visit sign_up_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end
