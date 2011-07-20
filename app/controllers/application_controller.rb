class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_admin
    raise CanCan::AccessDenied if !current_user.admin?
  end
end
