class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from OAuth2::Error do |exception|

    if exception.code == "invalid_request"
      sign_out(:user)
      authenticate_user!
    end

  end

end
