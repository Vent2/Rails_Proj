class ArtistsController < ApplicationController
    before_action :set_rave, only: [:new, :create, :show, :edit, :update]
    before_action :set_artists, only: [:show, :edit, :destroy]
    # before_action :set_user
    def index
        @artists = Artist.all
    end
    
    
    def show
    end
    
    def new
        @artist = Artist.new
        @artist.stages.build
    end
    
    def create
        @artist = Artist.create(artists_params(:name, stages_attributes: [:number, :rave_id]))
        if @artist
            
            

            # @stage = @rave.stages.build(rave_id: @rave.id)

            
            # byebug
            redirect_to  artist_path(@artist)
        else
        render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @artist.update(artists_params)
        redirect_to @artist
        else
        render 'edit'
        end
    end
    
    def destroy
        @artist =  Artist.find(params[:id])
        @artist.delete
        redirect_to rafe_path(@rave)
    end
    
    private
        def set_rave
        @rave = Rave.find_by(id: params[:rafe_id])
        
        end
    
        # def set_user
        # @user = User.find_by(id: session[:user_id])
        # end
        
        def set_artists
           @artist = Artist.find_by(id: params[:id])
        end

        # def rave_params
        #     params.require(:rave).permit(rave_ids: [])
        # end

        def artists_params(*args)
        params.require(:artist).permit(*args)
        end      
end
