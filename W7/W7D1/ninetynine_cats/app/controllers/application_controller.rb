class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    #skip_before_action :verify_authenticity_token

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end
    
    def logout!
        session[:session_token] = nil
        current_user.reset_session_token! if logged_in?
        @current_user = nil
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to new_session_url unless logged_in?
    end

    def require_logout
        redirect_to users_url if logged_in?
    end
end
