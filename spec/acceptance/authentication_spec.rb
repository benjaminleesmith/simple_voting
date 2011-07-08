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
end
