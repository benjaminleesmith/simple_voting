require 'spec_helper'

describe 'registration' do
  include Rails.application.routes.url_helpers

  it 'should not set admin to true for new users' do
    admin_login
    visit new_user_registration_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    user = User.last
    user.email.should == 'test@example.com'
    user.admin.should_not be
  end
end

def admin_login
  @user = Factory.create(:admin)
  visit new_user_session_path
  fill_in 'Email', with: 'admin@example.com'
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end