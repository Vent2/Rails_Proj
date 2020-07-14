class SessionsController < ApplicationController
    
   
   def new
      render 'signin'
    end

    def create
      if auth_hash = request.env['omniauth.auth']
         # raise.auth_hash.inspect
         user = User.find_or_create_by_omniauth(auth_hash)
         session[:user_id]  = user.id   
         redirect_to user_path
      else
        user = User.find_by(:email => params[:email])
         if user && user.authenticate(params[:password])
            # raise."stop".inspect 
            
            session[:user_id] = user.id
            redirect_to user_path(user)
         else
            # raise params.inspect
            # flash[:message] = "The email or password is incorrect."
            render 'signin' 
         end
      end
    end
    def destroy
        reset_session
        redirect_to root_path
    end
   
    private 
    def user_params(*args)
      params.require(:user).permit(*args)
  end
end