class UsersController < ApplicationController
    before_action :set_user, only: [:show, :index, :update, :destroy]
    
    def index
    end

    def new
        @user = User.new
    end
    
    def create 
        
        @user = User.new(user_params(:name, :email, :password))
        # byebug
        if @user.save
            redirect_to user_path(@user)
        else
            flash[:alert] = "Account was not created"
            render 'new'
        end
    end

        def show
            # require_login
        end

        def update
        end

        def destroy
        end












    private
    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params(*args)
        params.require(:user).permit(*args)
    end
    

end

