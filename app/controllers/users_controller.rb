class UsersController < ApplicationController
    before_action :set_user, :require_login, only: [:show, :edit, :update, :destroy]
    # before_action :require_login, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end
    
    def create 
        
        @user = User.new(user_params(:name, :email, :password))
        if @user.save
            session[:user_id]  = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Account was not created"
            render 'new'
        end
    end

        def show
            if current_user.id != params[:id].to_i 
                redirect_to user_path(current_user)
            end
            # byebug
            @raves =  Rave.all.select{|rave| rave.user_id == @user.id}
            # else
            #     @raves = Rave.all
        end

        def edit
            if current_user.id != params[:id].to_i 
                redirect_to user_path(current_user)
            end
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

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def validate_user
        if current_user.id != params[:id].to_i 
            redirect_to user_path(current_user)
        end
    end



    def user_params(*args)
        params.require(:user).permit(*args)
    end
    

end

