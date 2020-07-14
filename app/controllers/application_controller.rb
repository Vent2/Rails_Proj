class ApplicationController < ActionController::Base
    helper_method :current_user, :require_login

    def logged_in?
      !!current_user
    end
  
    private
  
      def require_login
        unless logged_in?
          flash[:message] = "You must be logged in to access this section"
          redirect_to root_path
        end
      end
  
      def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end
end
