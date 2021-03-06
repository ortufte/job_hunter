class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    
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
