class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private

    def logged_in?
        session[:user_id] 
    end
  
    def current_user
      @current_user ||= Parent.find(session[:user_id]) if session[:user_id]     
    end
end
