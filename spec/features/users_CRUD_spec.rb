require 'rails_helper'

RSpec.describe 'user_creation', type: :feature do
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
