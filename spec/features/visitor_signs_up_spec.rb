require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid credentials' do
    sign_up_with 'valid@example.com', 'password'

    expect (page).to have_content 'Sign out'
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid', 'password'

    expect (page).to have_content 'Invalid Email'
  end

  scenario 'with empty password' do
    sign_up_with 'valid@example.com', ''

    expect (page).to have_content 'Please enter a password'
  end

  def sign_up_with(user, password)
    fill_in 'user[username]', with: user
    fill_in 'user[password]', with: password
    click_on 'Create User'
  end
end
