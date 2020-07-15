class RavesController < ApplicationController
    before_action :set_user
    before_action :set_rave


    def index
        @rave = Rave.all
    end
    
    def new
        @rave = Rave.new
        ActionController::Parameters.permit_all_parameters = true
        # @rave.user_id = @user
    end

    def create
        # permitted = params.require(:rave).permit(:authenticity_token, :rave, :commit)

        @rave = Rave.new(rave_params(:name, :price, :date, :user_id))
        user = User.find_by(session[:user_id].to_s)
        @rave.user_id = user.id
        # raise."stop".inspect
        if @rave.save
            # raise."stop".inspect
            session[:user_id]  = user.id
            redirect_to rafe_path(@rave)
        else
            flash[:message] = "Account was not created"
            render 'new'
        end
    end

    def show

    end
    def edit
    end

    def update
    end

    def destroy
    end

    private
    def set_user
        @user = User.find_by(id: params[:id])
    end

    def set_rave
        @rave = Rave.find_by(id: params[:id])
    end

    def rave_params(*args)
        params.require(:rave).permit(*args)
    end
    

end
