class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :require_login
    private

    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path # halts request cycle
        end
      end

    def logged_in?
        session[:user_id] 
    end
  
    def current_user
      @current_user ||= Parent.find(session[:user_id]) if session[:user_id]     
    end
end
