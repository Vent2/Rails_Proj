class ArtistsController < ApplicationController
    before_action :set_rave, only: [:show, :edit, :update]
    before_action :set_user
    def index
        @artists = Artist.all
    end
    
    
    def show
        
    end
    
    def new
        if params[:user_id]
        
        end
        @rave = Rave.new
    end
    
    def create
        @rave = Rave.new(rave_params(:name, :price, :date, :user_id))
        if @rave.save
        redirect_to rafe_path(@rave)
        else
        render 'new'
        end
    end
    
    def edit
        @rave.user_id = params[:id]
    end
    
    def update
        if @rave.update(rave_params(:name, :price, :date, :user_id))
        redirect_to @rave
        else
        render 'edit'
        end
    end
    
    def destroy
        @rave =  Rave.find(params[:id])
        @rave.delete
        redirect_to user_path(@user)
    end
    
    private
        def set_rave
        @rave = Rave.find(params[:id])
        end
    
        def set_user
        @user = User.find_by(id: session[:user_id])
        end
    
        def rave_params(*args)
        params.require(:rave).permit(*args)
    end      
end
