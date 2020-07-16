class UsersController < ApplicationController
    before_action :set_user, only: [:show, :index, :edit, :update, :destroy]
    before_action :set_session

    def index
    end

    def new
        @user = User.new
    end
    
    def create 
        
        @user = User.new(user_params(:name, :email, :password))
        if @user.save
            session[:user_id]  = user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Account was not created"
            render 'new'
        end
    end

        def show
            # require_login
            # @rave = Rave.new
            # session[:user_id] = @rave.user_id
            @rave = session[:user_id]
        end

        def edit
        end
         

        def update
            @user.update(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
            redirect_to user_path(@user)
        end

        def destroy
            @user.delete
            flash[:alert] = "Account was deleted"
            redirect_to root_path
        end

    private

    def set_session
        session[:user_id]  = @user.id
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params(*args)
        params.require(:user).permit(*args)
    end
    

end

