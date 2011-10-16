class ApplicationController < ActionController::Base
  protect_from_forgery
  #layout lambda { user_signed_in? ? 'application' : 'welcome' }
  helper_method :current_user, :user_signed_in?, :sign_in_path

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      current_user.present?
    end

    def sign_in_path
      '/sign_in'
    end

    def authenticate_user!
      if user_signed_in?
        Twitter.oauth_token = current_user.token
        Twitter.oauth_token_secret = current_user.secret
      else
        flash[:error] = 'You need to sign in before accessing this page!'
        redirect_to sign_in_url
      end
    end
end
