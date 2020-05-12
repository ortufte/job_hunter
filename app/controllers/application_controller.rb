class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

    before_action :require_login 
    skip_before_action :require_login, only: [:index]

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
    
    def index
        @user = User.new
    end

    def current_user
        @current_user ||= User.find_by(:id => session[:user_id])
    end

    def logged_in?
        !!current_user
    end
    
end
