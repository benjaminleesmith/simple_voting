require 'spec_helper'

describe 'authentication' do
  include Rails.application.routes.url_helpers
  
  it 'should not show a logout link when logged out' do
    visit new_user_session_path
    page.should_not have_content 'Logout'
  end
  
  it 'should show a logout link when logged in' do
    login
    page.should have_content 'Logout'
  end

  it 'should allow user to change their password' do
    login
    page.should have_content 'Change Password'

    click_link 'Change Password'

    fill_in 'Password', with: 'new_password'
    fill_in 'Password confirmation', with: 'new_password'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    page.should have_content 'You updated your account successfully.'

    click_link 'Logout'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'new_password'


    click_button 'Sign in'

    page.should have_content 'Logout'
  end
end

def login
  @user = Factory.create(:user)
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end