require 'spec_helper'

describe Devise::RegistrationsController do
  include Rails.application.routes.url_helpers
  include Devise::TestHelpers
  
  before do
    # @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  it 'should not allow admin to be set via mass assignment' do
    pending 
    post :create, {"user"=>{"admin"=>"true", "email"=>"test@example.com", "password"=>"password", "password_confirmation"=>"password"}, "commit"=>"Sign up"}
    user = User.first
    user.admin.should_not be
  end
end