class ApplicationController < ActionController::Base
  protect_from_forgery
  #layout lambda { user_signed_in? ? 'application' : 'welcome' }
  helper_method :current_user, :user_signed_in?, :sign_in_path

  private
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      current_user.present?
    end

    def sign_in_path
      '/sign_in'
    end

    def sign_in_url
      url_for(sign_in_path)
    end

    def authenticate_user!
      if user_signed_in?
        Twitter.oauth_token = current_user.token
        Twitter.oauth_token_secret = current_user.secret
      else
        flash[:error] = t('need_to_sign_in')
        if request.xhr?
          render partial: 'shared/dialog', status: 403 # Forbidden
        else
          redirect_to root_url
        end
      end
    end

    def basic_authenticate
      username = ENV['BASIC_USERNAME'] || 'foo'
      password = ENV['BASIC_PASSWORD'] || 'bar'
      authenticate_or_request_with_http_basic do |u, p|
        (@name = u) == username && p == password
      end
    end
end
