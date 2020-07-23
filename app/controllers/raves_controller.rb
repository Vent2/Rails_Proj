class RavesController < ApplicationController
  before_action :set_rave, only: [:show, :edit, :update]
  before_action :set_user
  def index
     @raves = Rave.all
    #  binding.pry
    #  @rav = @raves.cheap
  end

 
  def show
    if @rave.stages.any?
    @a = Artist.find_by(id: @rave.stages[0][:artist_id])
    end
    render 'show'
  end

  def new
    @rave = Rave.new
    # @artist = @rave.artist.build
  end

  def create
    @rave = Rave.new(rave_params(:name, :price, :date, :user_id))
    if @rave.save
      @stage = @rave.stages.build(rave_id: @rave.id)
        # byebug
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

  # def destroy
  #   @rave =  Rave.find(params[:id])
  #   @rave.delete
  #   redirect_to user_path(@user)
  # end

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
